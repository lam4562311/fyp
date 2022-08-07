import rospy
from std_msgs.msg import String, Bool
from geometry_msgs.msg import Twist
import serial

def main():
    rospy.loginfo("Hi, It is from mbed_control.py")
    # starts the node
    rospy.init_node('mbed_control')
    device = rospy.get_param("/mbed_control/device")
    print(device)
    rospy.Subscriber("base_twist", Twist, callback)
    rospy.Subscriber("bt_r1", Bool, LED)
    rospy.Publisher("battery", String, tcp_nodelay=True, queue_size=1)
    while True:
        rospy.

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass