; Auto-generated. Do not edit!


(cl:in-package my_turtlebot_actions-msg)


;//! \htmlinclude record_odomGoal.msg.html

(cl:defclass <record_odomGoal> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass record_odomGoal (<record_odomGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <record_odomGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'record_odomGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name my_turtlebot_actions-msg:<record_odomGoal> is deprecated: use my_turtlebot_actions-msg:record_odomGoal instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <record_odomGoal>) ostream)
  "Serializes a message object of type '<record_odomGoal>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <record_odomGoal>) istream)
  "Deserializes a message object of type '<record_odomGoal>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<record_odomGoal>)))
  "Returns string type for a message object of type '<record_odomGoal>"
  "my_turtlebot_actions/record_odomGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'record_odomGoal)))
  "Returns string type for a message object of type 'record_odomGoal"
  "my_turtlebot_actions/record_odomGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<record_odomGoal>)))
  "Returns md5sum for a message object of type '<record_odomGoal>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'record_odomGoal)))
  "Returns md5sum for a message object of type 'record_odomGoal"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<record_odomGoal>)))
  "Returns full string definition for message of type '<record_odomGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal, empty                ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'record_odomGoal)))
  "Returns full string definition for message of type 'record_odomGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal, empty                ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <record_odomGoal>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <record_odomGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'record_odomGoal
))
