from robot_control_class import RobotControl 
rc = RobotControl()
l = rc.get_laser_full()
b = 0
for x in l:
    if x > b:
        b = x
print(b)