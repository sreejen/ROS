from robot_control_class import RobotControl 
rc = RobotControl()
a = int(input("Enter a number "))
laser1 = rc.get_laser(a)
print("Laser 1 output",laser1)