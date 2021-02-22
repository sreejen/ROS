#! /usr/bin/env python
import rospy
from sensor_msgs.msg import LaserScan

class LaserTopicReader():
    
    def __init__(self, topic_name = 'kobuki/laser/scan'):
        self._topic_name = topic_name
        self._sub = rospy.Subscriber(self._topic_name,LaserScan,self.topic_callback)
        self._laserdata = LaserScan()

    def topic_callback(self,msg):
        self._laserdata = msg
        rospy.logdebug(self._laserdata)

    def get_laserdata(self):
        return self._laserdata

    def wall_detection(self):
        laser_reading = self._laserdata.ranges
        wall_dict = {"Front":False,"Left":False,"Right":False}
        if min(laser_reading[340:380])<=0.20:
            wall_dict["Front"] = True
        if min(laser_reading[0:180])<=0.20:
            wall_dict["Right"] = True
        if min(laser_reading[540:719])<=0.20:
            wall_dict["Left"] = True
        return wall_dict

if __name__ =='__main__':
    try:
        rospy.init_node('laser_topic_subscriber')
        laser_topic_sub = LaserTopicReader()
        rospy.loginfo(laser_topic_sub.get_laserdata())
        rate = rospy.Rate(0.5)

        ctrl_c = False
        
        def shutdownhook():
            
            ctrl_c = True
            rospy.loginfo("shutdown time!")
        
        rospy.on_shutdown(shutdownhook)
        
        while not ctrl_c:
            data = laser_topic_sub.get_laserdata()
            rospy.loginfo(data)
            rate.sleep()
    except rospy.ROSInterruptException:
        pass