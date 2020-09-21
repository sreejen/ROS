from robot_control_class import RobotControl 

class square:
    def __init__(self,motion,clockwise,speed,time):
        self.rc = RobotControl()
        self.motion = motion
        self.clockwise = clockwise
        self.speed = speed
        self.time = time
        self.turn_time = 7
    def sq(self):
        i = 0
        while i<4:
            self.move_straight()
            self.turn()
            i+=1
    def move_straight(self):
        self.rc.move_straight_time(self.motion,self.speed,self.time)

    def turn(self):
        self.rc.turn(self.clockwise,self.speed,self.turn_time)
mr1 = square('forward', 'clockwise', 0.3, 4)
mr1.sq()
mr2 = square('forward', 'clockwise', 0.3, 8)
mr2.sq()