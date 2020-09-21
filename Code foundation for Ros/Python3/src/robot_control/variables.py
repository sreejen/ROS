from robot_control_class import RobotControl 
rc = RobotControl()
laser1 = rc.get_laser(360)
print("Laser 1 output",laser1)
laser2 = rc.get_laser(180)
print("Laser 2 output", laser2)
laser2 = rc.get_laser(299)
print("Laser 2 output", laser2)