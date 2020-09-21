from robot_control_class import RobotControl 
import time
import math
rc=RobotControl()
print(rc.move_straight_time("forward",1,1))
print(rc.turn("counter-clockwise",2,1))
print(rc.move_straight_time("forward",1,2))
print(rc.turn("counter-clockwise",2,1))
print(rc.move_straight_time("forward",1,2))
