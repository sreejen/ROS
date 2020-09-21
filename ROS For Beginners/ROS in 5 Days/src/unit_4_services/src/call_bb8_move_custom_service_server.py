#! /usr/bin/env python
import rospy
from bb8_custom.srv import bb_msg, bb_msgRequest
import sys
import rospkg

rospy.init_node('service_client')
rospack = rospkg.RosPack()
rospy.wait_for_service('/move_bb8_in_circle_custom')
traj_by_name_service = rospy.ServiceProxy('/move_bb8_in_circle_custom',bb_msg)
traj_by_name_object = bb_msgRequest()
traj_by_name_object.duration = 5
result = traj_by_name_service(traj_by_name_object)
print result