from robot_control_class import RobotControl
import math
def get_higest_lowest():
    rc = RobotControl()
    lc1 = rc.get_laser_full()
    #lc1 = [1,2,3,4,5,float('inf')]
    lc = []
    for x in lc1:
        if not math.isinf(x):
            #print (x)
            lc.append(x)
    #print (lc)
    #print (lc1)
    lw = min(lc)
    #print(lw)
    hw = max(lc)
    return lc1.index(hw),lc1.index(lw)
#j = get_higest_lowest()
#print (j)