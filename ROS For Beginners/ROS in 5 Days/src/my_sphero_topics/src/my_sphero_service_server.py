#! /usr/bin/env python
import rospy
from std_srvs.srv import Trigger, TriggerResponse
from my_sphero_imu import ImuTopicReader
import time

class crash_service_server():
    def __init__(self):
        self._imu_subscriber_obj = ImuTopicReader()
        self.my_service = rospy.Service('/crash_service_server',Trigger,self.my_callback)
        

    def my_callback(self,request):
        crash_dict = self._imu_subscriber_obj.four_sector_detection()
        crash_true = True in crash_dict.values()
        crash_resp = TriggerResponse()
        if crash_true:
            crash_resp.success = True
            if crash_dict["front"]:
                crash_resp.message = "Forward"
            elif crash_dict["left"]:
                crash_resp.message = "Turn left"
            elif crash_dict["right"]:
                crash_resp.message = "Turn right"
            elif crash_dict["back"]:
                crash_resp.message = "Backward"
        else:
            crash_resp.success = False
            crash_resp.message = "No crash"
        return crash_resp

if __name__ == '__main__':
    try:
        rospy.init_node('crash_service_server')
        crash_ser = crash_service_server()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass