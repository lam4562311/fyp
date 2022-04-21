from sre_constants import RANGE
from psutil import cpu_percent
import rospy
import numpy as np
import math
from std_msgs.msg import Float32MultiArray
from sensor_msgs.msg import LaserScan
# import lidar_scan
from lidar_scan.msg import range
from functools import reduce

def callback(msg):
    global variance
    range_flag = False
    angle_ranges = range()
    if msg.angle_min != 0.0:
        for i, item in enumerate(msg.ranges):
            if(i == len(msg.ranges) - 1):
                break
            distance_thd = item*(math.sin(msg.angle_increment) / math.sin(180/180*math.pi - msg.angle_increment)) + variance*3
            # print(distance_thd)
            # print(item - msg.ranges[i+1])
            if abs(item - msg.ranges[i+1]) < distance_thd and item < 60.0:
                if not range_flag:
                    range_flag = True
                    angle_ranges.angle.append( msg.angle_min - msg.angle_increment*i )
                    angle_ranges.distance.append(item)
            else:
                if range_flag:
                    range_flag = False
                    angle_ranges.angle.append( msg.angle_min - msg.angle_increment*i )
                    angle_ranges.distance.append(item)
        if range_flag:
            angle_ranges.angle.append( msg.angle_max)
            angle_ranges.distance.append(msg.ranges[-1])
        range_pub.publish(angle_ranges)
    else:
        mean = reduce(lambda x,y: x+y, msg.ranges)/len(msg.ranges)
        variance = (sum(map(lambda x:(x-mean)**2, msg.ranges))) / (len(msg.ranges) - 2)
def main():
    global distance_thd
    global variance
    global angle_ranges
    global range_pub
    
    distance_thd  = 0.
    variance = 0.
    angle_ranges = range()

    
    # publishing to "moving_base" and "fcn_button" to control mbed
    # starts the node
    rospy.init_node('lidar_processing_unit')
    rospy.Subscriber("/lidar_scan", LaserScan, callback)
    range_pub = rospy.Publisher("/lidar_processed_ranges",range,queue_size=1, tcp_nodelay = True, latch=True)
    rospy.loginfo("Hi, It is from lidar_processing.py")
    rospy.spin()

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass