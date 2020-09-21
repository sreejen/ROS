from robot_control_class import RobotControl 
rc = RobotControl()
l = rc.get_laser_full()
dic = {"0":l[0],"100":l[100],"200":l[200],"300":l[300],"400":l[400],"500":l[500],"600":l[600],"719":l[719],}
print( dic)