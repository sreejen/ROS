#! /usr/bin/env python
import rospy 
import actionlib
from  my_sphero_actions.msg import record_odomAction, record_odomFeedback, record_odomResult
from nav_msgs.msg import Odometry
from my_sphero_odm import OdomTopicReader
from odometry_analysis import check_if_out_maze
class Exit_maze():
    def __init__(self,maze_length):
        self._as = actionlib.SimpleActionServer("my_sphero_Ac_server", record_odomAction,self.goal_callback,False)
        self._as.start()
        self.odo_sub_obj = OdomTopicReader()
        self.goal_length = maze_length
        self.result_var = record_odomResult()
        self.time_limit = 120
    def goal_callback(self, goal):
        success = True
        r = rospy.Rate(1)

        for i in range(self.time_limit):
            rospy.loginfo("Recording Odom index="+str(i))

            if self._as.is_preempt_requested():
                rospy.logdebug('The goal has been cancelled/preempted')
                self._as.set_preempted()
                success = False
                break
            else:
                if not self.reached_distance_goal():
                    rospy.logdebug("Reading Odometry...")
                    self.result_var.result_odom_array.append(self.odo_sub_obj.get_odomdata())
                else:
                    rospy.logwarn('Reached distance Goal')
                    break
            r.sleep()
        if success:
            self._as.set_succeeded(self.result_var)

        self.clean_variables()
    def clean_variables(self):

        self.result_var = record_odomResult()    
    def reached_distance_goal(self):
        return check_if_out_maze(self.goal_length, self.result_var.result_odom_array)

if __name__ == "__main__":
    rospy.init_node('record_odom_action_server_node')
    Exit_maze(maze_length=2.0)
    rospy.spin()    