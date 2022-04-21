#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <iostream>
#include <signal.h>
#include "ros/ros.h"
#include "std_msgs/Empty.h"
#include "std_msgs/Float32MultiArray.h"
#include "sensor_msgs/LaserScan.h"
#include <time.h>
#include "serial/serial.h"
#include <wiringPi.h>

#define  PWM_PIN 12 //wPi 26 to BCM 12 to actual 32
#define GET_LOW_char(A) (uint8_t)((A))
//Macro function  get lower 8 bits of A
#define GET_HIGH_char(A) (uint8_t)((A) >> 8)
//Macro function  get higher 8 bits of A
#define char_TO_HW(A, B) ((((uint16_t)(A)) << 8) | (uint8_t)(B))
//put A as higher 8 bits   B as lower 8 bits   which amalgamated into 16 bits integer
#define M_PI 3.14159265358979323846
#define ANGLE M_PI/2
#define NUM_READING 201
#define SCAN_FREQ 100

uint8_t START_MEASURE[] = {0x55, 0x05, 0x00, 0x00, 0x00, 0x00, 0xCC, 0xAA};
uint8_t END_MEASURE[] = {0x55, 0x06, 0x00, 0x00, 0x00, 0x00, 0x88, 0xAA};
size_t size = 8;
size_t bytes_wrote;
std::string result = "";
serial::Serial lidar_serial("", 921600, serial::Timeout::simpleTimeout(1000));
uint32_t scan_freq = (uint32_t)SCAN_FREQ;
std::string device;

using namespace std;
using namespace ros;

uint8_t gencrc(uint8_t *data, size_t len)
{
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

void lidar_set_freq(uint32_t number){
    uint8_t buf[size];
    uint8_t* ex = &buf[1];
    buf[0] = 0x55;
    buf[1] = 0x03;
    buf[2] = (number & 0xff000000) >> 24;
    buf[3] = (number & 0x00ff0000) >> 16;
    buf[4] = (number & 0x0000ff00) >> 8;
    buf[5] =  number & 0x000000ff;
    buf[6] = gencrc(ex, 5);
    buf[7] = 0xAA;
    bytes_wrote = lidar_serial.write(&buf[0], size);
}
    
void mySigintHandler(int sig)

{

// Do some custom action.

pwmWrite(PWM_PIN, 50);

delay(1000);
bytes_wrote = lidar_serial.write(&END_MEASURE[0], size);
lidar_serial.flush();
lidar_serial.close();
ros::shutdown();

}

int main(int argc, char** argv)
{
    signal(SIGINT, mySigintHandler);
    int divsior = int(19200*1000/(50*2000));
    wiringPiSetupGpio();
    pinMode (PWM_PIN, PWM_OUTPUT);
    pwmSetMode (PWM_MODE_MS);
    pwmSetRange (2000);
    pwmSetClock (divsior);
    
    

    init(argc, argv, "lidar_scan_node");
    NodeHandle node;
    Publisher chatter_pub = node.advertise<sensor_msgs::LaserScan> ("/lidar_scan", 1);
    Publisher lidar_pub = node.advertise<std_msgs::Float32MultiArray> ("publisher", 10);
    Rate rate(100);
    
    node.param<std::string>("/lidar_scan_node/device", device, "/dev/ttyUSB0");
    lidar_serial.setPort(device);
    lidar_serial.open();
    ROS_INFO("device is [%s]\n", device.c_str());

    ros::Time scan_time;
    sensor_msgs::LaserScan lidar_scan_data;
    
    lidar_scan_data.header.frame_id = "laser_frame";
    lidar_scan_data.angle_increment = M_PI/(NUM_READING-1);
    lidar_scan_data.time_increment = (1/SCAN_FREQ) / NUM_READING;
    lidar_scan_data.range_min = 0.0;
    lidar_scan_data.range_max = 60.0;
    lidar_scan_data.angle_min = 0.0;
    lidar_scan_data.angle_max = 0.0;
    lidar_scan_data.ranges.resize(NUM_READING);
    

    struct timespec begin, end;
    lidar_set_freq(scan_freq);
    
    pwmWrite(PWM_PIN, 50);
    delay(500);
    bytes_wrote = lidar_serial.write(&START_MEASURE[0], size);
    
    for (int i = 0; i<=200; i++){
        lidar_serial.flush();
        result = lidar_serial.readline();
        lidar_scan_data.ranges[i] = std::stof(result);
    }
    bytes_wrote = lidar_serial.write(&END_MEASURE[0], size);
    lidar_serial.flush();
    scan_time = ros::Time::now();
    lidar_scan_data.header.stamp = scan_time;
    chatter_pub.publish(lidar_scan_data);

    lidar_scan_data.angle_min = ANGLE;
    lidar_scan_data.angle_max = -ANGLE;
    while (ros::ok()){

        clock_gettime(CLOCK_MONOTONIC_RAW, &begin);
        bytes_wrote = lidar_serial.write(&START_MEASURE[0], size);
        for (int i = 50; i<=250; i++){                 //right to left
            pwmWrite(PWM_PIN, i);
            // delay(10);
            lidar_serial.flush();
            result = lidar_serial.readline();
            lidar_scan_data.ranges[i-50] = std::stof(result);
            // ROS_INFO("distance: %d, %f", i, lidar_scan_data.ranges[i-50]);
            
        }
        bytes_wrote = lidar_serial.write(&END_MEASURE[0], size);
        lidar_serial.flush();
        scan_time = ros::Time::now();
        lidar_scan_data.header.stamp = scan_time;
        // lidar_scan_data.angle_min = ANGLE;
        // lidar_scan_data.angle_max = -ANGLE;

        chatter_pub.publish(lidar_scan_data);

        clock_gettime(CLOCK_MONOTONIC_RAW, &end);

        ROS_INFO("Total time = %f seconds\n",
            (end.tv_nsec - begin.tv_nsec) / 1000000000.0 +
            (end.tv_sec  - begin.tv_sec));

        delay(100);

        clock_gettime(CLOCK_MONOTONIC_RAW, &begin);
        bytes_wrote = lidar_serial.write(&START_MEASURE[0], size);
        for ( int i = 250; i>=50; i--){
            pwmWrite(PWM_PIN, i);
            // delay(10);
            lidar_serial.flush();
            result = lidar_serial.readline();
            lidar_scan_data.ranges[i-50] = std::stof(result);
            // ROS_INFO("distance: %d, %f", j, lidar_scan_data.ranges[j]);
        }
        bytes_wrote = lidar_serial.write(&END_MEASURE[0], size);
        lidar_serial.flush();
        scan_time = ros::Time::now();
        lidar_scan_data.header.stamp = scan_time;

        chatter_pub.publish(lidar_scan_data);

        clock_gettime(CLOCK_MONOTONIC_RAW, &end);
        ROS_INFO("Total time = %f seconds\n",
            (end.tv_nsec - begin.tv_nsec) / 1000000000.0 +
            (end.tv_sec  - begin.tv_sec));

        delay(100);
        }
    ros::shutdown();
    return 0;
}