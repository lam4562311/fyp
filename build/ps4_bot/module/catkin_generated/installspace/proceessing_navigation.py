import ps4_bot
from astar import AStarFinder, manhattan, octile, euclidean
from matrix import Matrix
from latlng_pixel import *
import numpy as np
import rospy
import math
from sensor_msgs.msg import Joy
from ps4_bot.msg import vertices
from ps4_bot.srv import navigation, navigationResponse, GpsCompass, GpsCompassResponse
from std_msgs.msg import Empty, Bool
from geometry_msgs.msg import Twist
from geographic_msgs.msg import GeoPoint
from rdp import rdp
from multiprocessing import mp

def callback2():
    while True:
        rospy.loginfo("running")
def callback():
    while True:
        result = rospy.wait_for_message('/1')
        rospy.loginfo("shutdown")
        a.unregister()
    
def main():
    global a
    rospy.loginfo("Hi, It is from navigating controller unit")
    rospy.init_node('navigation_processing_node', log_level=rospy.INFO)
    a = rospy.Subscriber('/2', callback2)
    p = mp.Process(target=callback)
    p.start()
    p.join
    rospy.spin()
    # controller_receiver = rospy.Subscriber('/navigation_processing')

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass