#! /usr/bin/python3
import os
working_path = os.path.realpath(os.path.dirname(__file__))
import sys
# sys.path.insert(0, '/home/amninder/Desktop/Folder_2')
os.chdir(working_path)
import ps4_bot

from astar import AStarFinder, manhattan, octile, euclidean
from matrix import Matrix
import numpy as np
import datetime
import cv2
import requests
import rospy
import threading
from sensor_msgs.msg import Joy
from ps4_bot.msg import Navigation
import json
class NavigationThread (threading.Thread):
    def __init__(self):
        super(NavigationThread, self).__init__()
        self.threadEvent = threading.Event()

    def run(self):
        while True:
            print("running")
            if self.is_stop():
                break
        print("break")

    def stop(self):
        self.threadEvent.set()

    def is_stop(self):
        return self.threadEvent.is_set()

# map of restricted zone
# x = requests.get('https://maps.googleapis.com/maps/api/staticmap?center=22.4567357441,%20114.000812285&zoom=19&size=395x457&maptype=roadmap&format=png&maptype=roadmap&style=element:geometry%7Ccolor:0xffffff&style=element:labels%7Cvisibility:off&style=feature:administrative%7Cvisibility:off&style=feature:poi%7Cvisibility:off&style=feature:road%7Cvisibility:off&style=feature:transit%7Cvisibility:off&style=feature:water%7Celement:geometry%7Ccolor:0x000000&key=AIzaSyB-tnCNMsE5fPFMVZXgg9hAgFwX8Qlwz5k')
# img_str = x.content

def main():
    print("Hi, It is from navigate.py")
    # starts the node
    rospy.init_node('navigation_node')
    rate = rospy.Rate(10)
    #navigation_sub
    #joy_sub
    #destroy_status
    out_file = open("img_str.json", "r")
    b = json.load(out_file)
    img_str = bytearray(b['img_str'], encoding="latin1")
    out_file.close()
    nparr = np.frombuffer(img_str, dtype=np.uint8)
    img = cv2.imdecode(nparr, cv2.COLOR_RGB2BGR) # cv2.IMREAD_COLOR in OpenCV 3.1
    cv2.imshow('map', img)
    cv2.waitKey()
    navigationThread = NavigationThread()
    navigationThread.start()
    navigationThread.stop()
    navigationThread.join()
    print(navigationThread.is_alive())
    # rospy.Subscriber("/navigation", Navigation, navigation_callback)
    rospy.spin()
if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass
