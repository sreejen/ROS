#! /usr/bin/env python
import rospy
from iri_wam_reproduce_trajectory.srv import ExecTraj, ExecTrajRequest
import sys
import rospkg

rospy.init_node('service_client')
rospack = rospkg.RosPack()
rospy.wait_for_service('/execute_trajectory')
traj_by_name_service = rospy.ServiceProxy('/execute_trajectory',ExecTraj)
traj_by_name_object = ExecTrajRequest()
traj_by_name_object.file = rospack.get_path('iri_wam_reproduce_trajectory')+"/config/get_food.txt"
result = traj_by_name_service(traj_by_name_object)
print result