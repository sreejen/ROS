; Auto-generated. Do not edit!


(cl:in-package my_sphero_actions-msg)


;//! \htmlinclude record_odomResult.msg.html

(cl:defclass <record_odomResult> (roslisp-msg-protocol:ros-message)
  ((result_odm_array
    :reader result_odm_array
    :initarg :result_odm_array
    :type (cl:vector nav_msgs-msg:Odometry)
   :initform (cl:make-array 0 :element-type 'nav_msgs-msg:Odometry :initial-element (cl:make-instance 'nav_msgs-msg:Odometry))))
)

(cl:defclass record_odomResult (<record_odomResult>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <record_odomResult>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'record_odomResult)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name my_sphero_actions-msg:<record_odomResult> is deprecated: use my_sphero_actions-msg:record_odomResult instead.")))

(cl:ensure-generic-function 'result_odm_array-val :lambda-list '(m))
(cl:defmethod result_odm_array-val ((m <record_odomResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_sphero_actions-msg:result_odm_array-val is deprecated.  Use my_sphero_actions-msg:result_odm_array instead.")
  (result_odm_array m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <record_odomResult>) ostream)
  "Serializes a message object of type '<record_odomResult>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'result_odm_array))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'result_odm_array))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <record_odomResult>) istream)
  "Deserializes a message object of type '<record_odomResult>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'result_odm_array) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'result_odm_array)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'nav_msgs-msg:Odometry))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<record_odomResult>)))
  "Returns string type for a message object of type '<record_odomResult>"
  "my_sphero_actions/record_odomResult")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'record_odomResult)))
  "Returns string type for a message object of type 'record_odomResult"
  "my_sphero_actions/record_odomResult")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<record_odomResult>)))
  "Returns md5sum for a message object of type '<record_odomResult>"
  "cd453c62b66583c68284da7f017a9a0c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'record_odomResult)))
  "Returns md5sum for a message object of type 'record_odomResult"
  "cd453c62b66583c68284da7f017a9a0c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<record_odomResult>)))
  "Returns full string definition for message of type '<record_odomResult>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%nav_msgs/Odometry[] result_odm_array~%~%================================================================================~%MSG: nav_msgs/Odometry~%# This represents an estimate of a position and velocity in free space.  ~%# The pose in this message should be specified in the coordinate frame given by header.frame_id.~%# The twist in this message should be specified in the coordinate frame given by the child_frame_id~%Header header~%string child_frame_id~%geometry_msgs/PoseWithCovariance pose~%geometry_msgs/TwistWithCovariance twist~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/PoseWithCovariance~%# This represents a pose in free space with uncertainty.~%~%Pose pose~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/TwistWithCovariance~%# This expresses velocity in free space with uncertainty.~%~%Twist twist~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'record_odomResult)))
  "Returns full string definition for message of type 'record_odomResult"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%nav_msgs/Odometry[] result_odm_array~%~%================================================================================~%MSG: nav_msgs/Odometry~%# This represents an estimate of a position and velocity in free space.  ~%# The pose in this message should be specified in the coordinate frame given by header.frame_id.~%# The twist in this message should be specified in the coordinate frame given by the child_frame_id~%Header header~%string child_frame_id~%geometry_msgs/PoseWithCovariance pose~%geometry_msgs/TwistWithCovariance twist~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/PoseWithCovariance~%# This represents a pose in free space with uncertainty.~%~%Pose pose~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/TwistWithCovariance~%# This expresses velocity in free space with uncertainty.~%~%Twist twist~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <record_odomResult>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'result_odm_array) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <record_odomResult>))
  "Converts a ROS message object to a list"
  (cl:list 'record_odomResult
    (cl:cons ':result_odm_array (result_odm_array msg))
))
