from robot_control_class import RobotControl
rc=RobotControl()
def test_return(a,b,c):
    
    l = [rc.get_laser_summit(a),rc.get_laser_summit(b),rc.get_laser_summit(c)]
    return l
v = test_return(4,231,632)
print ("The readings are ",v)