#! /usr/bin/env python
import rospy
import actionlib
import actionlib_msgs
import time
from actions_quiz.msg import CustomActionMsgAction,CustomActionMsgFeedback, CustomActionMsgResult
from std_msgs.msg import Empty

class quiz_class():
    _feedback = CustomActionMsgFeedback()
    _result = CustomActionMsgResult()
    def __init__(self):
        self._as = actionlib.SimpleActionServer("/action_custom_msg_as",CustomActionMsgAction,self.goal_callback,False)
        self._as.start()

    def takeoff_f(self):
        i=0
        while not i == 3:
            self._pub_takeoff.publish(self._takeoff_msg)
            rospy.loginfo('Taking off...')
            self._feedback.feedback = 'Taking off'
            time.sleep(1)
            i += 1
    def land_f(self):
        i=0
        while not i == 3:
            self._pub_takeoff.publish(self._land_msg)
            rospy.loginfo('Landing off...')
            self._feedback.feedback = 'LANDING'
            time.sleep(1)
            i += 1
    def goal_callback(self,goal):
        r = rospy.Rate(1)
        success = True
        self._pub_takeoff = rospy.Publisher('/drone/takeoff', Empty, queue_size=1)
        self._takeoff_msg = Empty()
        self._pub_land = rospy.Publisher('/drone/land', Empty, queue_size=1)
        self._land_msg = Empty()
        self._feedback.feedback = goal.goal
        if goal.goal =='LAND':
            self.land_f()
        elif goal.goal == 'TAKEOFF':
            self.takeoff_f()
        if self._as.is_preempt_requested():
            rospy.loginfo('The goal has been cancelled/preempted')
            self._as.set_preempted()
            success = False
        self._as.publish_feedback(self._feedback)
        # the sequence is computed at 1 Hz frequency
        r.sleep()
        if success:
            rospy.loginfo('result' )
            self._as.set_succeeded(self._result)
                
            # make the drone stop and land
            # self.stop_drone()
            # i=0
            # while not i == 3:
            #     self._pub_land.publish(self._land_msg)
            #     rospy.loginfo('Landing...')
            #     time.sleep(1)
            #     i += 1
if __name__ == '__main__':
    rospy.init_node('quiz_node')
    quiz_class()
    rospy.spin()