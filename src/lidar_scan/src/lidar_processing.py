import rospy
import numpy as np
import math
from sensor_msgs.msg import LaserScan

global distance_thd


def callback(msg):
    
    if msg.angle_min <0:
        for i, item in enumerate(msg.ranges):
            if(i == len(msg.ranges)):
                break
            distance_thd = item + 
            if abs(item - msg.ranges[i+1]) < 1.0:
                
def main():
    rospy.loginfo("Hi, It is from lidar_processing.py")
    # publishing to "moving_base" and "fcn_button" to control mbed
    # starts the node
    rospy.init_node('lidar_processing_unit')
    rospy.Subscriber("/lidar_scan", LaserScan, callback)
    rospy.spin()

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass