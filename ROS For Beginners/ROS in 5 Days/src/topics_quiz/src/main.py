#! /usr/bin/env python

import rospy
from geometry_msgs.msg import Twist
from std_msgs.msg import Float32
from sensor_msgs.msg import LaserScan

def laser_c(msg):
    # t = float32()
    # t = msg.ranges
    if msg.ranges[360]<1:
        var.angular.z = 1.0
        var.linear.x = 0.0
        pub.publish(var)
        # print "object infront"
        rate.sleep()
    if msg.ranges[0]<1:
        var.angular.z = -1.0
        var.linear.x = 0.0
        # print "object right side"
        pub.publish(var)
        rate.sleep()
    if msg.ranges[719]<1:
        var.angular.z = 1.0
        var.linear.x = 0.0
        # print "object left side"
        pub.publish(var)
        rate.sleep()
    else:
        var.linear.x = 0.5
        var.angular.z = 0.0
        # print "no object infront"
        pub.publish(var)
        rate.sleep()
    var.linear.x = 0.0
    var.angular.z = 0.0
    # print "stopping"
    pub.publish(var)
    rate.sleep()

if __name__=='__main__':
    try:
        rospy.init_node("topics_quiz_node")
        pub = rospy.Publisher("/cmd_vel",Twist,queue_size=1)
        rate = rospy.Rate(100)
        var = Twist()
        while not rospy.is_shutdown():
            sub = rospy.Subscriber("/kobuki/laser/scan",LaserScan,laser_c)
            rate.sleep()
    except rospy.ROSInterruptException:
        pass
