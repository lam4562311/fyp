#! /usr/bin/python3
import os
import ps4_bot
from astar import AStarFinder, manhattan, octile, euclidean
from matrix import Matrix
import numpy as np
import datetime
import cv2
import requests
import rospy
import threading
import json
import math
from sensor_msgs.msg import Joy
from ps4_bot.msg import vertices
from ps4_bot.srv import navigation, navigationResponse
from std_msgs.msg import Bool
from geographic_msgs.msg import GeoPoint
from rdp import rdp


OFFSET = 268435456 # half of the earth circumference's in pixels at zoom level 21
RADIUS = OFFSET / math.pi
working_path = os.path.realpath(os.path.dirname(__file__))
os.chdir(working_path)

class NavigationThread (threading.Thread):
    def __init__(self, vertice=None):
        super(NavigationThread, self).__init__()
        self.threadEvent = threading.Event()
        self.rate = rospy.Rate(100)
        self.vertice = vertice
    def run(self):
        while True:
            # print("running")
            if self.is_stop():
                break
            self.rate.sleep()
        print("break")

    def stop(self):
        self.threadEvent.set()

    def is_stop(self):
        return self.threadEvent.is_set()

class NavigationNode ():
    def __init__(self):
        rospy.init_node('navigation_node')
        self.navigationThread = NavigationThread()
        rospy.Service('/navigation', navigation, self.navigation_callback)
        self.pubstat = rospy.Publisher("/navigation_stat", Bool, queue_size = 1, tcp_nodelay = True)
        self.center = GeoPoint()
        self.min_pt = GeoPoint()
        self.max_pt = GeoPoint()
        self.half_of_size_x = 0
        self.half_of_size_y = 0
        self.matrix = []
        self.grid = Matrix()
        self.stat = Bool()
    def get_pixel(self, x, y, x_center, y_center, zoom_level):
        """
        x, y - location in degrees
        long lat
        x_center, y_center - center of the map
        zoom_level - same value as in the google static maps URL
        x_ret, y_ret - position of x, y in pixels relative to the center of the bitmap
        """
        x_ret = (self.lng_to_x(x) - self.lng_to_x(x_center)) >> (21 - zoom_level)
        y_ret = (self.lat_to_y(y) - self.lat_to_y(y_center)) >> (21 - zoom_level)
        return x_ret, y_ret

    def lng_to_x(self, x):
        return int(round(OFFSET + RADIUS * x * math.pi / 180))

    def lat_to_y(self, y):
        return int(round(OFFSET - RADIUS * math.log((1 + math.sin(y * math.pi / 180)) / (1 - math.sin(y * math.pi / 180))) / 2))

    def x_to_lng(self, x):
        return ((x - OFFSET) /RADIUS * 180  / math.pi)

    def y_to_lat(self, y):
        return math.asin(1 - (2/(math.exp((OFFSET - y) * 2 / RADIUS) + 1))) * 180 / math.pi

    def get_latlng(self, x_ret, y_ret, x_center, y_center, zoom_level):
        """
        x_ret : x coordinate
        y_ret : y coordinate
        x_center : lng of the center of the maps
        y_center : lat of the center of the maps
        """
        
        diff_x = x_ret << (21- zoom_level)
        diff_y = y_ret << (21- zoom_level)
        x = diff_x + self.lng_to_x(x_center)
        y = diff_y + self.lat_to_y(y_center)

        lng = self.x_to_lng(x)
        lat = self.y_to_lat(y)
        
        return lat, lng

    def get_map(self, center, SW, NE):
        # get the matrix of map
        sw_x, sw_y = self.get_pixel(SW.longitude, SW.latitude, center.longitude, center.latitude, 19) #SW
        ne_x, ne_y = self.get_pixel(NE.longitude, NE.latitude, center.longitude, center.latitude, 19) #NE
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
        height, width = img.shape
        for i in range(height):
            for j in range(width):
                # img[i, j] is the RGB pixel at position (i, j)
                # check if it's [0, 0, 0] and replace with [255, 255, 255] if so
                if img[i, j] != 0:
                    img[i, j] = 0
                else:
                    img[i, j] = 1
        return img
    def smooth_matrix(self):
        height, width = self.matrix.shape
        for y in range(height):
            for x in range(width):
                if self.matrix[y, x] == 1:
                    neighbors = 1
                    # up
                    if height > y - 1 >= 0 and not self.matrix[y - 1, x]:
                        neighbors += 1
                    # right
                    if width > x + 1 >= 0 and not self.matrix[y, x + 1]:
                        neighbors += 1
                    # down
                    if height > y + 1 >= 0 and not self.matrix[y + 1, x]:
                        neighbors += 1
                    # left
                    if width > x - 1 >= 0 and not self.matrix[y, x - 1]:
                        neighbors += 1
                    # ul
                    if width > x - 1 >= 0 and height > y - 1 >= 0 and not self.matrix[y - 1, x - 1]:
                        neighbors += 1
                    # ur
                    if width > x + 1 >= 0 and height > y - 1 >= 0 and not self.matrix[y - 1, x + 1]:
                        neighbors += 1
                    # dr
                    if width > x + 1 >= 0 and height > y + 1 >= 0 and not self.matrix[y + 1, x + 1]:
                        neighbors += 1
                    # dl
                    if width > x - 1 >= 0 and height > y + 1 >= 0 and not self.matrix[y + 1, x - 1]:
                        neighbors += 1
                    self.matrix[y, x] = neighbors
        for y in range(height):
            for x in range(width):
                if self.matrix[y, x] != 0:
                    max = 0
                    # up
                    if height > y - 1 >= 0:
                        if max < (self.matrix[y - 1, x]):
                            max = self.matrix[y - 1, x]
                    # right
                    if width > x + 1 >= 0:
                        if max < (self.matrix[y, x + 1]):
                            max =(self.matrix[y, x + 1])
                    # down
                    if height > y + 1 >= 0:
                        if max < (self.matrix[y + 1, x]):
                            max =(self.matrix[y + 1, x])
                    # left
                    if width > x - 1 >= 0:
                        if max < (self.matrix[y, x - 1]):
                            max =(self.matrix[y, x - 1])
                    # ul
                    if width > x - 1 >= 0 and height > y - 1 >= 0:
                        if max < (self.matrix[y - 1, x -1]):
                            max =(self.matrix[y - 1, x -1])
                    # ur
                    if width > x + 1 >= 0 and height > y - 1 >= 0:
                        if max < (self.matrix[y - 1, x +1]):
                            max =(self.matrix[y - 1, x +1])
                    # dr
                    if width > x + 1 >= 0 and height > y + 1 >= 0:
                        if max < (self.matrix[y + 1, x +1]):
                            max =(self.matrix[y + 1, x +1])
                    # dl
                    if width > x - 1 >= 0 and height > y + 1 >= 0:
                        if max < (self.matrix[y + 1, x -1]):
                            max =(self.matrix[y + 1, x -1])
                    if max - 1 > 1 and max - 1 > self.matrix[y, x]:
                        self.matrix[y, x] = max - 1

    def add_forbidden_zone(self, polygons):
        contours = []
        for items in polygons:
            polygon = []
            for element in items.vertices:
                x_ret, y_ret = self.get_pixel(element.longitude,element.latitude, self.center.longitude, self.center.latitude, 19)
                [x, y] = x_ret + self.half_of_size_x, y_ret + self.half_of_size_y
                polygon.append([x, y])
            contours.append(polygon)
        cv2.fillPoly(self.matrix, np.array(contours), color=0)

    def navigation_callback(self, msg):
        # 1. create matrix from map
        if self.navigationThread.is_alive():
            self.navigationThread.stop() #
            self.navigationThread.join() 
        if msg.navigation_status:
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
                self.smooth_matrix()
                self.grid = Matrix(map = self.matrix)
                
            
            self.grid.cleanup()
            start_x, start_y = self.get_pixel(msg.start.longitude,msg.start.latitude, msg.center.longitude, msg.center.latitude, 19 )
            start_x = start_x + self.half_of_size_x
            start_y = start_y + self.half_of_size_y
            start = self.grid.node(start_x,start_y)
            goal_x, goal_y = self.get_pixel(msg.goal.longitude,msg.goal.latitude, msg.center.longitude, msg.center.latitude, 19 )
            goal_x = goal_x + self.half_of_size_x
            goal_y = goal_y + self.half_of_size_y
            end = self.grid.node(goal_x,goal_y)
            print('start: {}, {}\ngoal: {}, {}'.format(start_x, start_y, goal_x, goal_y))
            #3.create a finder with a movement style
            finder = AStarFinder(heuristic=manhattan, diagonal_movement = 1,weight = 1)
            path, runs = finder.find_path(start,end,self.grid)
            path = rdp(path,5.0)
            vertice = []
            for item in path:
                lat, lng = self.get_latlng(item[0] - self.half_of_size_x, item[1] - self.half_of_size_y,msg.center.longitude,msg.center.latitude, 19)
                vertice.append(GeoPoint(lat, lng, 0.0))
            print(vertice)
            msg_vertices = vertices()
            msg_vertices.vertices = vertice
            self.navigationThread = NavigationThread(vertice)
            self.navigationThread.start() #
            self.stat.data = True
            self.pubstat.publish(self.stat)
            return navigationResponse(msg_vertices)
            
        else:
            self.stat.data = False
            self.pubstat.publish(self.stat)

# def add_two_ints_client(x, y):
#     rospy.wait_for_service('add_two_ints')
#     try:
#         add_two_ints = rospy.ServiceProxy('add_two_ints', AddtwoInts)
#         resp1 = add_two_ints(x, y)
#         return resp1.sum
#     except rospy.ServiceException as e:
#         print("Service call failed: %s"%e)

def main():
    print("Hi, It is from navigate.py")
    # starts the node   
    # global navigationThread
    # rospy.init_node('navigation_node')
    # navigationThread = NavigationThread()
    #navigation_sub
    #joy_sub
    #destroy_status
    node = NavigationNode()
    out_file = open("img_str.json", "r")
    b = json.load(out_file)
    img_str = bytearray(b['img_str'], encoding="latin1")
    out_file.close()
    rospy.spin()
if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass
