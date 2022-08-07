#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <iostream>
#include <sstream>
#include <signal.h>
#include "ros/ros.h"
#include "std_msgs/String.h"
#include "std_msgs/Bool.h"
#include "geometry_msgs/Twist.h"
#include <time.h>
#include "serial/serial.h"
#define MAX_BUFFER_SIZE         32

using namespace std;
using namespace ros;

string device = "";
serial::Serial mbed_serial("", 115200, serial::Timeout::simpleTimeout(10));
uint8_t buffer[MAX_BUFFER_SIZE] = {0};

uint8_t gencrc(uint8_t *data, size_t len){
    uint8_t crc = 0x00;
    uint8_t i, j;
    while(len--)
    {
        crc ^= *data++;
        for(i=8;i>0;--i)
        {
            if(crc & 0x80)
                crc = (crc << 1) ^ 0x31;
            else
                crc = (crc << 1);
        }
    }
    return crc;
}

void retrieve_val(std_msgs::String*msg, uint8_t* buf, size_t len){
    std::stringstream data;
    int val;

    if (buf[0] == 0x55 && buf[len-1] == 0xAA){
        if (gencrc(&buf[1], len-3) == buf[len-2]){
            ROS_DEBUG("%d", buf[1]);
            if (buf[1] == 0x03){
                memcpy(&val, &buf[2], len-3);
                data << val;
                msg->data = data.str();
                }
            else
                ROS_DEBUG("Unrecognized code");
                    
            }
        }
}

void base_callback(const geometry_msgs::Twist::ConstPtr& msg){
    uint8_t buf[12];
    buf[0] = 0x55;
    buf[1] = 0x01;
    memcpy(&buf[2], &msg->linear.x, sizeof(msg->linear.x));
    memcpy(&buf[6], &msg->linear.y, sizeof(msg->linear.y));
    buf[10] = gencrc(&buf[1], 9);
    buf[11] = 0xAA;
    mbed_serial.write(&buf[0], 12);
}

void r1_callback(const std_msgs::Bool::ConstPtr& msg){
    uint8_t buf[5];
    buf[0] = 0x55;
    buf[1] = 0x02;
    memcpy(&buf[2], &msg->data, sizeof(msg->data));
    buf[3] = gencrc(&buf[1], 2);
    buf[4] = 0xAA;
    mbed_serial.write(&buf[0], 5);
    ROS_DEBUG("%d, %d, %d, %d, %d", buf[0],buf[1],buf[2],buf[3],buf[4]);
}

void mySigintHandler(int sig){
    mbed_serial.flush();
    mbed_serial.close();
    ros::shutdown();
}

int main(int argc, char** argv){
    signal(SIGINT, mySigintHandler);

    init(argc, argv, "mbed_node");

    NodeHandle node;
    Publisher battery_pub = node.advertise<std_msgs::String> ("/battery", 1);
    Subscriber base_sub = node.subscribe("/base_twist", 1, base_callback);
    Subscriber r1_sub = node.subscribe("/bt_r1", 1, r1_callback);

    serial::Timeout timeout = mbed_serial.getTimeout();

    ROS_DEBUG("%u--%u--%u--%u--%u", timeout.inter_byte_timeout,timeout.read_timeout_constant,timeout.read_timeout_multiplier,timeout.write_timeout_constant,timeout.write_timeout_multiplier);

    node.param<std::string>("/mbed_node/device", device, "/dev/ttyUSB0");
    ROS_INFO("device is [%s]\n", device.c_str());
    mbed_serial.setPort(device);
    mbed_serial.open();
    size_t size = 0;
    std_msgs::String msg;
    struct timespec begin, end;
    
    while (ros::ok()){
        // if 
        if (mbed_serial.waitReadable()){
            
            size = mbed_serial.read(buffer, MAX_BUFFER_SIZE);
            ROS_DEBUG("%d",size);
            retrieve_val(&msg, buffer, size);
            ROS_DEBUG("retrieved");
            battery_pub.publish(msg);
        }
        spinOnce();
        
    }
    ros::shutdown();
    return 0;
}