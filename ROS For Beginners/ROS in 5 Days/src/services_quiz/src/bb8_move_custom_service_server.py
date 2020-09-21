#! /usr/bin/env python
import rospy
from services_quiz.srv import BB8CustomServiceMessage, BB8CustomServiceMessageResponse
from geometry_msgs.msg import Twist
def move_straight(side,move):
    j = 0
    s =side
    while j <= s :
        move.linear.x = 1.0                                    #Straight Line
        move.angular.z = 0.0
        pub.publish(move)
        rate.sleep()
        j = j+1
    return None
def rotate(move):
    i = 0
    while i <= 1:
        move.linear.x = 0.0                                    #90 degree turn for 2 seconds
        move.angular.z = 3.14/4
        pub.publish(move)
        rate.sleep()
        i = i+1
    return None
def stop(move):
    # i =0
    # while i < 2:
    move.linear.x = 0.0                                    #stopping
    move.angular.z = 0.0
    pub.publish(move)
    rate_s.sleep()
        # i = i+1
    return None
# def repp(side,move):
#     j = 0
#     s =side
#     while j < s :
#         move.linear.x = 2.0                                    #Straight Line
#         move.angular.z = 0.0
#         pub.publish(move)
#         rate.sleep()
#         j = j+1
#         #print j
#     i = 0 
#     while i < 3:
#         move.linear.x = 0.0                                    #stopping
#         move.angular.z = 0.0
#         pub.publish(move)
#         rate.sleep()
#         i = i+1
#     i = 0
#     while i < 1:
#         move.linear.x = 0.0                                    #90 degree turn for 2 seconds
#         move.angular.z = 3.14/4
#         pub.publish(move)
#         rate.sleep()
#         i = i+1
#         #print i
#     i = 0 
#     while i < 3:
#         move.linear.x = 0.0                                    #stopping
#         move.angular.z = 0.0
#         pub.publish(move)
#         rate.sleep()
#         i = i+1
def my_callback(request):
    # rospy.loginfo("Call back function accesed")
    rep = 0 
    r = request.repetitions
    while rep < r:
        # repp(request.side,move)
        # repp(request.side,move)
        # repp(request.side,move)
        # repp(request.side,move)
        # move.linear.x = 0.0                                    #stopping
        # move.angular.z = 0.0
        # pub.publish(move)
        # rate_s.sleep()
        # rate.sleep()
        move_straight(request.side,move)
        stop(move)
        rate_s.sleep()
        rotate(move)
        stop(move)
        rate_s.sleep()
        move_straight(request.side,move)
        stop(move)
        rate_s.sleep()
        rotate(move)
        stop(move)
        rate_s.sleep()
        move_straight(request.side,move)
        stop(move)
        rate_s.sleep()
        rotate(move)
        stop(move)
        rate_s.sleep()
        move_straight(request.side,move)
        stop(move)
        rate_s.sleep()
        rotate(move)
        stop(move)
        rate_s.sleep()
        rep = rep + 1
    response = BB8CustomServiceMessageResponse()
    response.success = True
    return response

# rospy.loginfo("Server side Initialize")
rospy.init_node('service_move_bb8_in_square_custom_server')
my_service = rospy.Service('/move_bb8_in_square_custom',BB8CustomServiceMessage,my_callback)
pub = rospy.Publisher('/cmd_vel',Twist,queue_size=1)
move = Twist()
rate = rospy.Rate(1)
rate_s = rospy.Rate(0.33)
rospy.spin()
