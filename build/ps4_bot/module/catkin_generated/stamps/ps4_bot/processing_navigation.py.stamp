import lidar_scan
from lidar_scan.msg import range
import ps4_bot
from astar import AStarFinder, manhattan, octile, euclidean
from matrix import Matrix
from latlng_pixel import *
import numpy as np
import rospy
import math
import bisect

from ps4_bot.msg import vertices, Navigation
from ps4_bot.srv import GpsCompass
from std_msgs.msg import Empty, Bool
from geometry_msgs.msg import Twist
from rdp import rdp

class Navigation_Processing_Node():
    def __init__(self):
        rospy.init_node("navigation_processing_node", log_level=rospy.INFO)
        
        self.vertices = vertices()
        self.pubtw = rospy.Publisher("/base_twist", Twist, queue_size = 1, tcp_nodelay = True)
        self.pubPolyline = rospy.Publisher("/polyline", vertices, queue_size = 1, tcp_nodelay = True)
        self.rate = rospy.Rate(10)
        self.stat = Bool()
        self.gps_compass = rospy.ServiceProxy("/GPS_COMPASS", GpsCompass)
        self.pubsetup = rospy.Publisher("/processing_node_setup", Empty, queue_size = 1, tcp_nodelay=True, latch = True)
        self.pubstat = rospy.Publisher("/navigation_stat", Bool, queue_size = 1, tcp_nodelay = True)
        self.finder = AStarFinder(heuristic=manhattan, diagonal_movement = 1,weight = 1)
        self.pubsetup.publish(Empty())
        

    def callback(self, msg):
        
        center = msg.center
        half_of_size_x = msg.half_of_size_x
        half_of_size_y = msg.half_of_size_y
        matrix = np.frombuffer(msg.matrix, dtype=np.uint8).reshape(msg.height, msg.width)
        self.grid =  Matrix(map = matrix)
        self.path = np.array(msg.path).reshape(-1,2)
        base_twist = Twist()
        while self.path.size != 0:
            result = self.gps_compass(Empty())
            rospy.loginfo('------------------------------------------------------------------')
            rospy.loginfo(result)
            #lidar
            x, y = get_pixel(result.position.longitude,result.position.latitude, center.longitude, center.latitude, 19 )
            self.path[0] = current = [x + half_of_size_x, y + half_of_size_y]
            target = self.path[1]
            rospy.loginfo(
                'current : {}, target : {}'.format(current, target)
            )
            if np.all(abs(current - target) <=5):
                if len(self.path) <=2:
                    break
                self.path = self.path[1:]
                target = self.path[1]
            start = self.grid.node(current[0], current[1])
            end = self.grid.node(target[0], target[1])
            self.grid.cleanup()
            path, runs = self.finder.find_path(start,end,self.grid)
            path = rdp(path,5.0)
            rospy.logdebug("original path: {}, path: {}".format(self.path, path))
            if len(path) != 0: 
                self.path = np.row_stack([path,self.path[2:]])
            rospy.loginfo("renewnal path: \n{}".format(self.path))
            self.vertices.vertices = list(map(lambda item : mapping_Pixel_To_Geo(item, half_of_size_x, half_of_size_y, center), self.path))
            rospy.logdebug(self.vertices)
            self.pubPolyline.publish(self.vertices)

            path_angle = math.atan2(target[0]-current[0], -target[1]+current[1]) * 180 / math.pi
            rospy.loginfo(path_angle-result.angle)
            angle = path_angle-result.angle
            
            #lidar
            lidar_msg = None
            try:
                lidar_msg = rospy.wait_for_message('/lidar_processed_ranges', range,timeout=0.5)
            except:
                rospy.loginfo("timeout exceeded while waiting for message on topic")

            rospy.loginfo("turning angle: {}".format(angle))

            if abs(angle) < 90 and lidar_msg is not None:
                i = bisect.bisect(lidar_msg.angle, angle/180*math.pi)
                if i != 0 or i != len(lidar_msg.angle):

                    if i %2 == 0:
                        renewnal_angle = (lidar_msg.angle[i+1] + lidar_msg.angle[i]) / 2
                    else:
                        renewnal_angle = (lidar_msg.angle[i-1] + lidar_msg.angle[i]) / 2
                elif i == 0:
                    renewnal_angle = (lidar_msg.angle[i] + -(math.pi)/2) / 2
                else:
                    renewnal_angle = (lidar_msg.angle[i] + (math.pi)/2) / 2
                
                rospy.loginfo(" renewnal_angle: {}".format (renewnal_angle/math.pi*180))
                base_twist.linear.x, base_twist.linear.y = np.round(math.sin(renewnal_angle), 2), np.round(math.cos(renewnal_angle), 2)
            else:
                base_twist.linear.x, base_twist.linear.y = np.round(math.sin(angle/180*math.pi), 2), np.round(math.cos(angle/180*math.pi), 2)


            
            
            rospy.loginfo("twist : x: {}, y: {}".format( base_twist.linear.x, base_twist.linear.y))
            self.pubtw.publish(base_twist)

            self.rate.sleep()
        self.pubstat.publish(self.stat)
        base_twist.linear.x, base_twist.linear.y = 0.0, 0.0
        self.pubtw.publish(base_twist)
        

def shutdown():
    base_twist = Twist()
    node.pubtw.publish(base_twist)
    rospy.loginfo("processing unit shutdown time!")

def main():
    rospy.loginfo("Hi, It is from navigating controller unit")
    rospy.on_shutdown(shutdown)
    global node
    node = Navigation_Processing_Node()
    node.callback(rospy.wait_for_message("/processing_navigation", Navigation))
    rospy.spin()

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass