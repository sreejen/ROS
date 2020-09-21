#! /usr/bin/env python
import rospy
from services_quiz.srv import BB8CustomServiceMessage, BB8CustomServiceMessageRequest

rospy.init_node('Service_client')
rospy.wait_for_service('/move_bb8_in_square_custom')
ros_client = rospy.ServiceProxy('/move_bb8_in_square_custom',BB8CustomServiceMessage)
ros_ob = BB8CustomServiceMessageRequest()
ros_ob.side = 2
ros_ob.repetitions = 2
result = ros_client(ros_ob)

ros_ob.side = 3
ros_ob.repetitions = 1
result = ros_client(ros_ob)

print result