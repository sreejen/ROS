from robot_control_class import RobotControl

rc = RobotControl()
l = rc.get_laser(360)

while l>1:
    rc.move_straight()
    l = rc.get_laser(360)
rc.stop_robot()
rc.rotate(-90)
rc.stop_robot()