#! /usr/bin/env python

import rospy
from std_srvs.srv import Trigger, TriggerRequest

class crash_service_client():
    def __init__(self):
        
        rospy.wait_for_service('/crash_service_server')
        self.crash_service_client_s = rospy.ServiceProxy('/crash_service_server',Trigger)
        self.crash_trigger_obj = TriggerRequest()
     
    def read_data(self):
        self.result = self.crash_service_client_s(self.crash_trigger_obj)
        if self.result.success:
            rospy.logwarn("Success =="+str(self.result.success)) # print the result given by the service called
            rospy.logwarn("Direction To Go=="+str(self.result.message)) # print the result given by the service called
        else:   
            rospy.loginfo("Success =="+str(self.result.success)) # print the result given by the service called
            rospy.loginfo("Direction To Go=="+str(self.result.message)) # print the result given by the service called
        
def shutdownhook():
    ctrl_c = True
if __name__ == '__main__':
    rospy.init_node('crash_service_client')
    crash_client = crash_service_client()
    ctrl_c = False
    rospy.on_shutdown(shutdownhook)
    rate = rospy.Rate(5)
    while not ctrl_c:
        crash_client.read_data()
        rate.sleep()