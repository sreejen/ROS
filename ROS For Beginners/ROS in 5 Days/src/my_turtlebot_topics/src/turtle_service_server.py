#! /usr/bin/env python  
import rospy
from std_srvs.srv import Trigger, TriggerResponse
from turtle_laser_sub import LaserTopicReader

class wall_detect_server():
    
    def __init__(self):
        self._laser_sub_obj = LaserTopicReader()
        self.my_service = rospy.Service('/wall_detect_server', Trigger,self.callback)
    
    def callback(self,request):
        wall_dict = self._laser_sub_obj.wall_detection()
        wall_status = True in wall_dict.values()
        wall_response = TriggerResponse()

        if wall_status:
            wall_response.success = True
            if wall_dict["Front"]:
                if wall_dict["Right"]:
                    if wall_dict["left"]:
                        wall_response.message = "Turn back"
                    else:
                        wall_response.message = "Turn left"
                else:
                    wall_response.message = "Turn right"
            elif wall_dict["Right"]:
                wall_response.message = "Turn left"
            elif wall_dict["Left"]:
                wall_response.message = "Turn right"
        else:
            wall_response.success = False
            wall_response.message = "Forward"
        return wall_response

if __name__ == "__main__":
    try:
        rospy.init_node("wall_detect_service_server")
        wall_server_obj = wall_detect_server()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass