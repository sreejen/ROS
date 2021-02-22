#! /usr/bin/env python
import rospy
from std_msgs.msg import Empty

def callback(msg):
    rospy.loginfo('Print')




if __name__ =='__main__':
    rospy.init_node('topic_subscriber')
    rate = rospy.Rate(1)
    try:
        sub = rospy.Subscriber("/counter",Empty,callback)
        rate.sleep()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass