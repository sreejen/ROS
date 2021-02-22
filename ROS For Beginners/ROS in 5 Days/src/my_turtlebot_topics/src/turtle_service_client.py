#! /usr/bin/env python
import rospy
from std_srvs.srv import Trigger, TriggerRequest

class wall_service_client():
    
    def __init__(self):
        rospy.wait_for_service('/wall_detect_server')
        self._wall_client = rospy.ServiceProxy('/wall_detect_server',Trigger)
        self._client_request_obj = TriggerRequest()

    def read_data(self):
        self.result = self._wall_client(self._client_request_obj)
        if self.result.success:
            rospy.logwarn("Success =="+str(self.result.success)) 
            rospy.logwarn("Direction To Go=="+str(self.result.message)) 
        else:   
            rospy.loginfo("Success =="+str(self.result.success)) 
            rospy.loginfo("Direction To Go=="+str(self.result.message)) 
        

if __name__ == "__main__":
    try:
        rospy.init_node("wall_detect_service_client")
        wall_client_obj = wall_service_client()
        ctrl_c = False
        rate = rospy.Rate(5)
        def shutdownhook():
            ctrl_c = True
            rospy.logwarn("Shutting down ")
        
        while not ctrl_c:
            wall_client_obj.read_data()
            rate.sleep()
    except rospy.ROSInterruptException:
        pass