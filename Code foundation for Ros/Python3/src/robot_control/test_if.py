from robot_control_class import RobotControl 
rc = RobotControl()
l = rc.get_laser(360)
if l <=1:
    rc.stop_robot()
else:
    rc.move_straight()
print ("laser reading %d" % l)    