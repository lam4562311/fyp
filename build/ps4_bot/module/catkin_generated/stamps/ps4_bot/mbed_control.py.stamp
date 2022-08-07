import rospy
from std_msgs.msg import String, Bool
from geometry_msgs.msg import Twist
import serial

def main():
    rospy.loginfo("Hi, It is from mbed_control.py")
    # starts the node
    rospy.init_node('mbed_control')
    st = rospy.get_param("/mbed_control/device")
    print(st)

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass