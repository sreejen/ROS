#! /usr/bin/env python 
import rospy
from sub_ex.msg import age

rospy.init_node("age_node")
pub = rospy.Publisher('/age_robot', age, queue_size=1)
rate = rospy.Rate(2)
r_age= age()
r_age.years = 5
r_age.months = 2
r_age.days = 1
while not rospy.is_shutdown():
    pub.publish(r_age)
    rate.sleep()
