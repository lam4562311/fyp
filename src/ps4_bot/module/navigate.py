#! /usr/bin/python3
import os, signal
import subprocess
import ps4_bot
from astar import AStarFinder, manhattan, octile, euclidean
from matrix import Matrix
from latlng_pixel import *
import numpy as np
import datetime
import cv2
import requests
import rospy
import time
import json
import math
from numba import njit
from ps4_bot.msg import vertices, Navigation
from ps4_bot.srv import navigation, navigationResponse
from std_msgs.msg import Empty, Bool
from sensor_msgs.msg import Joy
from geographic_msgs.msg import GeoPoint
from rdp import rdp

working_path = os.path.realpath(os.path.dirname(__file__))
os.chdir(working_path)

class NavigationNode ():
    def __init__(self):
        self.center = GeoPoint()
        self.min_pt = GeoPoint()
        self.max_pt = GeoPoint()
        self.half_of_size_x = 0
        self.half_of_size_y = 0
        self.matrix = []
        self.grid = Matrix()
        self.empty = Empty()
        self.stat = Bool()
        self.msg_vertices = vertices()
        self.nav_data = Navigation()
        self.smooth_matrix_in_C = njit(smooth_matrix)
        rospy.init_node('navigation_controller_node', log_level=rospy.INFO)
        rospy.loginfo('init_node')
        self.rate = rospy.Rate(1)

        self.pubstat = rospy.Publisher("/navigation_stat", Bool, queue_size = 1, tcp_nodelay = True)
        self.nav = rospy.Publisher("/processing_navigation", Navigation, queue_size = 1, tcp_nodelay = False)

        rospy.Service('/navigation', navigation, self.navigation_callback)
        rospy.Subscriber("joy", Joy, self.joy_callback)

    def get_map(self, center, SW, NE):
        # get the matrix of map
        sw_x, sw_y = get_pixel(SW.longitude, SW.latitude, center.longitude, center.latitude, 19) #SW
        ne_x, ne_y = get_pixel(NE.longitude, NE.latitude, center.longitude, center.latitude, 19) #NE
        x = -sw_x + ne_x
        y = sw_y - ne_y
        if(x % 2 == 0):
            x+=1
        if(y % 2 == 0):
            y+=1
        base_url = 'https://maps.googleapis.com/maps/api/staticmap?center='
        center = '' + str(center.latitude)+',%20'+str(center.longitude)
        zoom = '&zoom=19&size='
        size = str(x)+'x'+str(y)
        map_key = '&maptype=roadmap&format=png&maptype=roadmap&style=element:geometry%7Ccolor:0xffffff&style=element:labels%7Cvisibility:off&style=feature:administrative%7Cvisibility:off&style=feature:poi%7Cvisibility:off&style=feature:road%7Cvisibility:off&style=feature:transit%7Cvisibility:off&style=feature:water%7Celement:geometry%7Ccolor:0x000000&key=AIzaSyB-tnCNMsE5fPFMVZXgg9hAgFwX8Qlwz5k'
        url = ''.join([base_url, center,zoom, size, map_key])
        # x = requests.get('https://maps.googleapis.com/maps/api/staticmap?center=22.4567357441,%20114.000812285&zoom=19&size=395x457&maptype=roadmap&format=png&maptype=roadmap&style=element:geometry%7Ccolor:0xffffff&style=element:labels%7Cvisibility:off&style=feature:administrative%7Cvisibility:off&style=feature:poi%7Cvisibility:off&style=feature:road%7Cvisibility:off&style=feature:transit%7Cvisibility:off&style=feature:water%7Celement:geometry%7Ccolor:0x000000&key=AIzaSyB-tnCNMsE5fPFMVZXgg9hAgFwX8Qlwz5k')
        # img_bytes = x.content

        # since billing expired, use static json instead 
        out_file = open("img_str.json", "r")
        file_json = json.load(out_file)
        img_bytes = bytearray(file_json['img_str'], encoding="latin1")
        out_file.close()
        return img_bytes, x, y

    def map_to_matrix(self, bytes):

        nparr = np.frombuffer(bytes, dtype=np.uint8)
        img = cv2.imdecode(nparr, cv2.COLOR_RGB2BGR) # cv2.IMREAD_COLOR in OpenCV 3.1
        img = cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)
        matrix = np.logical_not(img).astype(dtype=np.uint8)
        return matrix


    def add_forbidden_zone(self, polygons):
        cv2.fillPoly(self.matrix, np.array([list(map(lambda element : mapping_Geo_To_Pixel(element, self.half_of_size_x, self.half_of_size_y, self.center), item.vertices)) for item in polygons]), color=0)

    def navigation_callback(self, msg):
        for line in os.popen("ps ax | grep " + "processing_navigation.py" + " | grep -v grep"):
            fields = line.split()
            pid = fields[0]
            os.kill(int(pid), signal.SIGTERM)
            rospy.loginfo("terminate processing unit")
        # 1. create matrix from map
        if msg.navigation_status:
            self.rate.sleep()
            result = rospy.wait_for_message('/processing_node_setup', Empty)
            rospy.loginfo(result)
            if self.center.latitude != msg.center.latitude or self.center.longitude != msg.center.longitude or self.min_pt.latitude != msg.boundary.min_pt.latitude or self.min_pt.longitude != msg.boundary.min_pt.longitude or self.max_pt.latitude != msg.boundary.max_pt.latitude or self.max_pt.longitude != msg.boundary.max_pt.longitude:
                self.center.latitude = msg.center.latitude
                self.center.longitude = msg.center.longitude
                self.min_pt.latitude = msg.boundary.min_pt.latitude
                self.min_pt.longitude = msg.boundary.min_pt.longitude
                self.max_pt.latitude = msg.boundary.max_pt.latitude
                self.max_pt.longitude = msg.boundary.max_pt.longitude
                img_bytes, sizeofMap_x, sizeofMap_y = self.get_map(msg.center, msg.boundary.min_pt, msg.boundary.max_pt)
                self.half_of_size_x = int((sizeofMap_x + 1) / 2)
                self.half_of_size_y = int((sizeofMap_y + 1) / 2)
                self.matrix = self.map_to_matrix(img_bytes)
                self.add_forbidden_zone(msg.polygons)
                self.smooth_matrix_in_C(self.matrix)
                self.grid = Matrix(map = self.matrix)
            
            self.grid.cleanup()
            start_x, start_y = get_pixel(msg.start.longitude,msg.start.latitude, self.center.longitude, self.center.latitude, 19 )
            start_x += self.half_of_size_x
            start_y += self.half_of_size_y
            start = self.grid.node(start_x,start_y)
            goal_x, goal_y = get_pixel(msg.goal.longitude,msg.goal.latitude, self.center.longitude, self.center.latitude, 19 )
            goal_x += self.half_of_size_x
            goal_y += self.half_of_size_y
            end = self.grid.node(goal_x,goal_y)
            rospy.loginfo('start: {}, {}\ngoal: {}, {}'.format(start_x, start_y, goal_x, goal_y))
            #3.create a finder with a movement style
            finder = AStarFinder(heuristic=manhattan, diagonal_movement = 1,weight = 1)
            self.path, runs = finder.find_path(start,end,self.grid)
            self.path = rdp(self.path,5.0)
            
            self.msg_vertices.vertices = list(map(lambda item : mapping_Pixel_To_Geo(item, self.half_of_size_x, self.half_of_size_y, self.center),self.path))
            
            self.nav_data.center, self.nav_data.half_of_size_x, self.nav_data.half_of_size_y, self.nav_data.width, self.nav_data.height, self.nav_data.matrix, self.nav_data.path = self.center, self.half_of_size_x, self.half_of_size_y, self.half_of_size_x * 2 - 1, self.half_of_size_y * 2 - 1, list(self.matrix.flatten()), sum(self.path,[])
            self.nav.publish(self.nav_data)
            self.stat.data = True
            self.pubstat.publish(self.stat)
            return navigationResponse(self.msg_vertices)
            
        else:
            self.stat.data = False
            self.pubstat.publish(self.stat)

    def joy_callback(self, data):
        if self.stat.data and (data.axes[0] != 0.0 or data.axes[1] != 0.0):
            self.stat.data = False
            self.pubstat.publish(self.stat)
            for line in os.popen("ps ax | grep " + "processing_navigation.py" + " | grep -v grep"):
                fields = line.split()
                pid = fields[0]
                os.kill(int(pid), signal.SIGTERM)
                rospy.loginfo("terminate processing unit")
def smooth_matrix(matrix):

    height, width = matrix.shape
    for y in range(height):
        for x in range(width):
            if matrix[y, x] == 1:
                neighbors = 1
                # up
                if height > y - 1 >= 0 and not matrix[y - 1, x]:
                    neighbors += 1
                # right
                if width > x + 1 >= 0 and not matrix[y, x + 1]:
                    neighbors += 1
                # down
                if height > y + 1 >= 0 and not matrix[y + 1, x]:
                    neighbors += 1
                # left
                if width > x - 1 >= 0 and not matrix[y, x - 1]:
                    neighbors += 1
                # ul
                if width > x - 1 >= 0 and height > y - 1 >= 0 and not matrix[y - 1, x - 1]:
                    neighbors += 1
                # ur
                if width > x + 1 >= 0 and height > y - 1 >= 0 and not matrix[y - 1, x + 1]:
                    neighbors += 1
                # dr
                if width > x + 1 >= 0 and height > y + 1 >= 0 and not matrix[y + 1, x + 1]:
                    neighbors += 1
                # dl
                if width > x - 1 >= 0 and height > y + 1 >= 0 and not matrix[y + 1, x - 1]:
                    neighbors += 1
                matrix[y, x] = neighbors
    for y in range(height):
        for x in range(width):
            if matrix[y, x] != 0:
                max = 0
                # up
                if height > y - 1 >= 0:
                    if max < (matrix[y - 1, x]):
                        max = matrix[y - 1, x]
                # right
                if width > x + 1 >= 0:
                    if max < (matrix[y, x + 1]):
                        max =(matrix[y, x + 1])
                # down
                if height > y + 1 >= 0:
                    if max < (matrix[y + 1, x]):
                        max =(matrix[y + 1, x])
                # left
                if width > x - 1 >= 0:
                    if max < (matrix[y, x - 1]):
                        max =(matrix[y, x - 1])
                # ul
                if width > x - 1 >= 0 and height > y - 1 >= 0:
                    if max < (matrix[y - 1, x -1]):
                        max =(matrix[y - 1, x -1])
                # ur
                if width > x + 1 >= 0 and height > y - 1 >= 0:
                    if max < (matrix[y - 1, x +1]):
                        max =(matrix[y - 1, x +1])
                # dr
                if width > x + 1 >= 0 and height > y + 1 >= 0:
                    if max < (matrix[y + 1, x +1]):
                        max =(matrix[y + 1, x +1])
                # dl
                if width > x - 1 >= 0 and height > y + 1 >= 0:
                    if max < (matrix[y + 1, x -1]):
                        max =(matrix[y + 1, x -1])
                if max - 1 > 1 and max - 1 > matrix[y, x]:
                    matrix[y, x] = max - 1

def shutdown():
    for line in os.popen("ps ax | grep " + "processing_navigation.py" + " | grep -v grep"):
        fields = line.split()
        pid = fields[0]
        os.kill(int(pid), signal.SIGTERM)
        rospy.loginfo("terminate processing_unit")
    # proc.terminate()
    rospy.loginfo("navigate controller shutdown time!")
def main():
    rospy.loginfo("Hi, It is from navigate.py")
    global node
    # global proc
    # starts the node
    #navigation_sub
    #joy_sub
    #destroy_status

    node = NavigationNode()
    
    rospy.on_shutdown(shutdown)
    rospy.spin()
if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass
