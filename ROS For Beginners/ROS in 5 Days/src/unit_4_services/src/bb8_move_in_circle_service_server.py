#! /usr/bin/env python
import rospy
from std_srvs.srv import Empty, EmptyResponse
from geometry_msgs.msg import Twist

def my_callback(request):
    rospy.loginfo("Call back function accesed")
    t.linear.x = 1.0
    # t.linear.y = 1.0
    t.angular.z = 0.5
    pub.publish(t)
    return EmptyResponse()

if __name__ == '__main__':
    try:
        rospy.loginfo("Server side Initialize")
        rospy.init_node('service_server')
        my_service = rospy.Service('/move_bb8_in_circle',Empty,my_callback)
        pub = rospy.Publisher('/cmd_vel',Twist,queue_size=1)
        t = Twist()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass