#! /usr/bin/env python 
import rospy
from geometry_msgs.msg import Twist

class CmdVelPub():
    
    def __init__(self):
        self._cmd_vel_pub = rospy.Publisher('/cmd_vel',Twist,queue_size=1)
        self._twist_obj = Twist()
        
    
    def move_robot(self,direction = 'forward',linearspeed = 0.2,angularspeed = 0.5):
        if direction == 'forward':
            self._twist_obj.linear.x = linearspeed
            self._twist_obj.angular.z = 0
        # elif direction == 'backward':
        #     self._twist_obj.linear.x = -linearspeed
        #     self._twist_obj.angular.z = 0
        elif direction == 'right':
            self._twist_obj.linear.x = 0
            self._twist_obj.angular.z = angularspeed
        elif direction == 'left':
            self._twist_obj.linear.x = 0
            self._twist_obj.angular.z = -angularspeed
        elif direction == 'stop':
            self._twist_obj.linear.x = 0
            self._twist_obj.angular.z = 0
        else:
            pass
        self._cmd_vel_pub.publish(self._twist_obj)

        
if __name__ =='__main__':
    try:
        rospy.init_node('cmd_vel_publisher_node')
        cmd_pub_obj = CmdVelPub()
    
        rate = rospy.Rate(1)
        ctrl_c = False

        def shutdownhook():
            global ctrl_c
            
            rospy.loginfo("shutdown time!")
            ctrl_c = True
            cmd_pub_obj.move_robot(direction = "stop")

        rospy.on_shutdown(shutdownhook)

        while not ctrl_c:
            cmd_pub_obj.move_robot()
            rate.sleep()
    except rospy.ROSInterruptException:
        pass