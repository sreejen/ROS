#! /usr/bin/env python
import rospy
import time 
import actionlib
from ardrone_as.msg import ArdroneAction,ArdroneGoal, ArdroneResult,ArdroneFeedback
from geometry_msgs.msg import Twist
from std_msgs.msg import Empty

class movedrone:
    def __init__(self):
        self.move_drone_pub = rospy.Publisher('/cmd_vel',Twist,queue_size=1)
        self.move = Twist()
        self.takeoff = rospy.Publisher('/drone/takeoff', Empty, queue_size=1)                        #Create a Publisher to takeoff the drone
        self.takeoff_msg = Empty()                                                                   #Create the message to takeoff the drone
        self.land = rospy.Publisher('/drone/land', Empty, queue_size=1)                              #Create a Publisher to land the drone
        self.land_msg = Empty()                                                                      #Create the message to land the drone    
        self.ctrl_c = False
        self.rate = rospy.Rate(10)
        rospy.on_shutdown(self.shutdownhook)
    def publish_once_in_cmd(self):

        while not self.ctrl_c:
            connections = self.move_drone_pub.get_num_connections()
            if connections >0:
                self.move_drone_pub.publish(self.move)
                # rospy.loginfo('Message Published')
                break
            else:
                self.rate.sleep()
    
    def shutdownhook(self):
        self.ctrl_c = True
    
    def takeoff_f(self):
        i = 0
        while i<3: 
            self.takeoff.publish(self.takeoff_msg)
            time.sleep(1)
            i=i+1

    def land_f(self):
        i=0
        while not i == 3:
            self.move.linear.x = 0
            self.move.angular.z = 0
            self.publish_once_in_cmd()
            self.land.publish(self.land_msg)
            # rospy.loginfo('Landing...')
            time.sleep(1)
            i += 1

    def move_cmd(self):
        self.move.linear.x = 0.2       
        # rospy.loginfo("Moving Drone!")
        self.publish_once_in_cmd()
        self.rate.sleep()
        

def feedback_callback(feedback):
    global nImage
    print('[feedback] image n.%d recevied'%nImage)
    nImage +=1
if __name__ == '__main__':
            
    nImage = 1
    PENDING = 0
    ACTIVE = 1
    DONE = 2
    WARN = 3
    ERROR = 4

    rospy.init_node('drone_action_client')
    move_d = movedrone()
    try:
        client = actionlib.SimpleActionClient('/ardrone_action_server',ArdroneAction)

        client.wait_for_server()
        goal = ArdroneGoal()
        goal.nseconds = 10
        client.send_goal(goal, feedback_cb=feedback_callback)
        state_result = client.get_state()

        rate = rospy.Rate(1)

        rospy.loginfo("state_result: "+str(state_result))
        rospy.loginfo("Take off starting")
        move_d.takeoff_f()
        rospy.loginfo("Moving the drone")
        while state_result < DONE:
            move_d.move_cmd()
            rate.sleep()
            state_result = client.get_state()
            rospy.loginfo("state_result: "+str(state_result))
            
        rospy.loginfo("[Result] State: "+str(state_result))
        if state_result == ERROR:
            rospy.logerr("Something went wrong in the Server Side")
        if state_result == WARN:
            rospy.logwarn("There is a warning in the Server Side")
        rospy.loginfo("Landing")
        move_d.land_f()
    except rospy.ROSInterruptException:
        pass
