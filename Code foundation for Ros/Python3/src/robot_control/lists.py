from robot_control_class import RobotControl 
rc = RobotControl()
l = rc.get_laser_full()
print("Reading 0", l[0],"Reading 360", l[360],"Reading 719", l[719])