#! /usr/bin/env python
import rospy
from std_srvs.srv import Empty, EmptyRequest
if __name__ == '__main__':
    try:
        rospy.loginfo("Client side initialize")
        rospy.init_node('service_client')
        rospy.wait_for_service('/move_bb8_in_circle')
        call_service = rospy.ServiceProxy('/move_bb8_in_circle',Empty)
        call_object = EmptyRequest()
        result = call_service(call_object)
    except rospy.ROSInterruptException:
        pass