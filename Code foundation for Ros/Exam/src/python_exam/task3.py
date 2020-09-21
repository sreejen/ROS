from robot_control_class import RobotControl
import math
class ExamControl:
    def __init__(self):
        self.rc = RobotControl()
    
    def get_laser_readings(self):
        self.lf = self.rc.get_laser(719)
        self.rf = self.rc.get_laser(0)
        return self.lf,self.rf
    def main(self):
        self.l, self.r = self.get_laser_readings()
        #print (self.l,self.r)
        while not math.isinf(self.l) or not math.isinf(self.r): 
            self.rc.move_straight()
            self.l, self.r = self.get_laser_readings()
        self.rc.stop_robot()
