#! /usr/bin/env python
import rospy
from geometry_msgs.msg import Twist

rospy.init_node('first_node')
var = Twist()
pub = rospy.Publisher('/cmd_vel',Twist,queue_size=1)
rate = rospy.Rate(2)

while not rospy.is_shutdown():
    var.linear.x = 0.5
    var.angular.z = 0.5
    pub.publish(var)
    rate.sleep()