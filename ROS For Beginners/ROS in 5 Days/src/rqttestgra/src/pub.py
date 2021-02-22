#! /usr/bin/env python
import rospy
from std_msgs.msg import Empty

if __name__ =='__main__':
    rospy.init_node('topic_publisher')
    pub = rospy.Publisher("/counter",Empty,queue_size=1)
    t = Empty()
    rate = rospy.Rate(1)
    try:
        for x in range(100):
            pub.publish(t)
            rate.sleep()
    except rospy.ROSInterruptException:
        pass