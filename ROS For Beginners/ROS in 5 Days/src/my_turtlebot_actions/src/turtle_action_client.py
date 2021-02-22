#! /usr/bin/env python
import rospy
import actionlib
from my_turtlebot_actions.msg import record_odomAction, record_odomFeedback, record_odomResult, record_odomGoal
from nav_msgs.msg import Odometry

def feedback_callback(feedback):
    rospy.loginfo("Rec Odom Feedback feedback ==>"+str(feedback))


def count_seconds(seconds):
    for i in range(seconds):
        rospy.loginfo("Seconds Passed =>"+str(i))
        time.sleep(1)

if __name__ == "__main__":
    try:
        rospy.init_node('record_odom_action_client_node')
        client = actionlib.SimpleActionClient('/action_server', record_odomAction)
        rate = rospy.Rate(1)
        rospy.loginfo('Waiting for action Server')
        client.wait_for_server()
        rospy.loginfo('Action Server Found...')
        goal = record_odomGoal()
        client.send_goal(goal, feedback_cb=feedback_callback)
        state_result = client.get_state()

        """
        class SimpleGoalState:
            PENDING = 0
            ACTIVE = 1
            DONE = 2
            WARN = 3
            ERROR = 4

        """

        rospy.loginfo("state_result: "+str(state_result))
        i = 0
        while state_result < 2:
            rospy.loginfo("Waiting to finish: ")
            rate.sleep()
            state_result = client.get_state()
            rospy.loginfo("state_result: "+str(state_result))
            i = i+1
            if i > 10:
                client.cancel_goal()

        state_result = client.get_state()
        rospy.loginfo("[Result] State: "+str(state_result))
        if state_result == 4:
            rospy.logerr("Something went wrong in the Server Side")
        if state_result == 3:
            rospy.logwarn("There is a warning in the Server Side")

        rospy.loginfo("[Result] State: "+str(client.get_result()))
    
    except rospy.ROSInterruptException:
        pass