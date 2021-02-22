#! /usr/bin/env python
import rospy
import actionlib
from std_srvs.srv import Trigger, TriggerRequest
from turtle_pub import CmdVelPub
from my_turtlebot_actions.msg import record_odomGoal, record_odomFeedback, record_odomResult, record_odomAction
from odometry_analysis import check_if_out_maze

class turtle_main():
    def __init__(self, goal_distance):
        self.init_action_client()
        self.init_pub_topic()
        self.init_service_client()
        self._goal_distance =  goal_distance

    def init_service_client(self,service_name = '/wall_detect_server'):
        self.ser_obj = rospy.ServiceProxy(service_name,Trigger)
        rospy.loginfo("waiting for service")
        rospy.wait_for_service(service_name)
        rospy.loginfo("service found")
        self.crash_trigger_obj = TriggerRequest()

    def init_action_client(self,action_name = '/action_server'):
        self.action_client = actionlib.SimpleActionClient(action_name, record_odomAction)
        rospy.loginfo('Waiting for action Server')
        self.action_client.wait_for_server()
        rospy.loginfo('Action Server Found...')
        self._goal_object = record_odomGoal()

    def init_pub_topic(self):
        self._pub_topic_obj = CmdVelPub()
    
    def get_direction(self):
        response = self.ser_obj(self.crash_trigger_obj)
        return response.message

    def send_goal_action_server(self):
        self.action_client.send_goal(self._goal_object,feedback_cb =self.feedback_callback)
    
    def feedback_callback(self,feedback):
        rospy.loginfo("Action Feedback ==>" + str(feedback))

    def status_action_server(self):
        return (self.action_client.get_state()>=2)
    
    def move_sphero(self, dir):
        self._pub_topic_obj.move_robot(direction = dir)
    
    def get_odom_data(self):
        return self.action_client.get_result()

    def check_out_of_maze(self,odom_arry):
        return check_if_out_maze(self._goal_distance,odom_arry)

if __name__ == '__main__':
    rospy.init_node('Main program')
    rospy.loginfo("Main program starting")
    main_obj = turtle_main(goal_distance = 100.0)
    rate = rospy.Rate(1)
    main_obj.send_goal_action_server()
    
    while not main_obj.status_action_server:
        rospy.loginfo("Getting the next direction")
        next_dir = main_obj.get_direction()
        rospy.loginfo(next_dir)
        main_obj.move_sphero(next_dir)
        rate.sleep()

odom_result = main_obj.get_odom_data()
odom_result_array = odom_result.result_odom_array
    
if main_obj.check_out_of_maze(odom_result_array):
    rospy.loginfo("Out of Maze")
else:
    rospy.loginfo("In Maze")

rospy.loginfo("Sphero Maze test Finished")