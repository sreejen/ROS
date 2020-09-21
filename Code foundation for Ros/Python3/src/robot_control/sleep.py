from robot_control_class import RobotControl 
import time

def sleept(t=5):
    rc = RobotControl()
    rc.move_straight()
    time.sleep(t)
    rc.stop_robot()
sleept(2)