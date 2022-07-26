import rospy
import RPi.GPIO as GPIO
# import wiringpi
channel = 32

def main():
    GPIO.setmode(GPIO.BOARD)
    GPIO.setwarnings(True)
    GPIO.setup(channel, GPIO.OUT)
    # wiringpi.wiringPiSetup()

def shutdown():
    GPIO.cleanup()

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass