#! /usr/bin/python3

from numpy.lib.nanfunctions import _remove_nan_1d
import rospy
import numpy as np
import math
from geometry_msgs.msg import Twist
from std_msgs.msg import String
from std_msgs.msg import Bool
from std_msgs.msg import Float32MultiArray
from std_msgs.msg import Int32MultiArray
from geometry_msgs.msg import Twist
from sensor_msgs.msg import Joy

pubax = None
pubtw = None
pubbt = None
pubr1 = None

auto_speed = False
LED_control = False
twist = Twist()
l1 = Bool()
r1 = Bool()

l1.data = False
r1.data = False

def callback(data):
    global auto_speed
    global LED_control
    ax = Float32MultiArray()
    bt = Int32MultiArray()
    # for index in range(0,13):
    # 	bt.data.append(data.buttons[index]) # square, cross, circle, triangle, 0-3
	# 	                                    # L1, R1, L2, R2, share, option, 4-9
	# 	                                    # L3, R3, ps, touch 10-13
    bt.data = data.buttons
    speeding_fac = 1.0
    if bt.data[6] != l1.data:
        l1.data = bt.data[6]
        if l1.data == 1:
            auto_speed = not auto_speed
    if bt.data[7] != LED_control:
        LED_control = bt.data[7]
        if LED_control == 1:
            r1.data = not r1.data
        rospy.loginfo("LED: {}".format(r1.data))
        pubr1.publish(r1)
    # elif bt.data[7] == 1:
    #     speeding_fac=0.8
    # if bt.data[8] == 1:
    #     reverse_fac *= -1.0
    ax1 = np.round(data.axes[0], 2)
    ax2 = np.round(data.axes[1], 2)
    ax3 = np.round(data.axes[2], 2)
    
    ax.data.append(24.0 * np.round(data.axes[0], 2))	# LL0
    ax.data.append(round(ax2, 2))	# LU0
    ax.data.append(round(ax3, 2))	# RL0
    ax.data.append(24*speeding_fac*data.axes[5])	# RU0
    ax.data.append(24*data.axes[3])			# L21
    ax.data.append(24*data.axes[4])			# R21
    ax.data.append(data.axes[6])			# KL0
    ax.data.append(data.axes[7])			# KU0
    
    if (not(twist.linear.x == ax1 and twist.linear.y == ax2) and auto_speed== False):
        twist.linear.x = -ax1
        twist.linear.y = ax2
        rospy.loginfo("x: {}, y: {}".format(twist.linear.x, twist.linear.y))
        pubtw.publish(twist)
    twist.angular.z = ax3
    
    pubax.publish(ax)
    pubbt.publish(bt)
# Intializes everything
def start():
    rospy.loginfo("Hi, It is from Joy2mbed.py")
    # publishing to "moving_base" and "fcn_button" to control mbed
    global pubax
    global pubbt
    global pubtw
    global pubr1
    # starts the node
    rospy.init_node('Joy2mbed')
    rate = rospy.Rate(10)
    pubax = rospy.Publisher('moving_base', Float32MultiArray, queue_size = 1, tcp_nodelay = True)
    pubbt = rospy.Publisher('fcn_button', Int32MultiArray, queue_size = 1, tcp_nodelay = True)
    pubtw = rospy.Publisher('base_twist', Twist, queue_size = 1, tcp_nodelay = True)
    pubr1= rospy.Publisher('bt_r1', Bool, queue_size = 1, tcp_nodelay = True)
    # subscribed to joystick inputs on topic "joy"
    rospy.Subscriber("joy", Joy, callback)
    rospy.spin()
if __name__ == '__main__':
    try:
        start()
    except rospy.ROSInterruptException:
        pass
