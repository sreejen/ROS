;; Auto-generated. Do not edit!


(when (boundp 'my_sphero_actions::record_odomResult)
  (if (not (find-package "MY_SPHERO_ACTIONS"))
    (make-package "MY_SPHERO_ACTIONS"))
  (shadow 'record_odomResult (find-package "MY_SPHERO_ACTIONS")))
(unless (find-package "MY_SPHERO_ACTIONS::RECORD_ODOMRESULT")
  (make-package "MY_SPHERO_ACTIONS::RECORD_ODOMRESULT"))

(in-package "ROS")
;;//! \htmlinclude record_odomResult.msg.html
(if (not (find-package "NAV_MSGS"))
  (ros::roseus-add-msgs "nav_msgs"))


(defclass my_sphero_actions::record_odomResult
  :super ros::object
  :slots (_result_odm_array ))

(defmethod my_sphero_actions::record_odomResult
  (:init
   (&key
    ((:result_odm_array __result_odm_array) (let (r) (dotimes (i 0) (push (instance nav_msgs::Odometry :init) r)) r))
    )
   (send-super :init)
   (setq _result_odm_array __result_odm_array)
   self)
  (:result_odm_array
   (&rest __result_odm_array)
   (if (keywordp (car __result_odm_array))
       (send* _result_odm_array __result_odm_array)
     (progn
       (if __result_odm_array (setq _result_odm_array (car __result_odm_array)))
       _result_odm_array)))
  (:serialization-length
   ()
   (+
    ;; nav_msgs/Odometry[] _result_odm_array
    (apply #'+ (send-all _result_odm_array :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; nav_msgs/Odometry[] _result_odm_array
     (write-long (length _result_odm_array) s)
     (dolist (elem _result_odm_array)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; nav_msgs/Odometry[] _result_odm_array
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _result_odm_array (let (r) (dotimes (i n) (push (instance nav_msgs::Odometry :init) r)) r))
     (dolist (elem- _result_odm_array)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get my_sphero_actions::record_odomResult :md5sum-) "cd453c62b66583c68284da7f017a9a0c")
(setf (get my_sphero_actions::record_odomResult :datatype-) "my_sphero_actions/record_odomResult")
(setf (get my_sphero_actions::record_odomResult :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
nav_msgs/Odometry[] result_odm_array

================================================================================
MSG: nav_msgs/Odometry
# This represents an estimate of a position and velocity in free space.  
# The pose in this message should be specified in the coordinate frame given by header.frame_id.
# The twist in this message should be specified in the coordinate frame given by the child_frame_id
Header header
string child_frame_id
geometry_msgs/PoseWithCovariance pose
geometry_msgs/TwistWithCovariance twist

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: geometry_msgs/PoseWithCovariance
# This represents a pose in free space with uncertainty.

Pose pose

# Row-major representation of the 6x6 covariance matrix
# The orientation parameters use a fixed-axis representation.
# In order, the parameters are:
# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
float64[36] covariance

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/TwistWithCovariance
# This expresses velocity in free space with uncertainty.

Twist twist

# Row-major representation of the 6x6 covariance matrix
# The orientation parameters use a fixed-axis representation.
# In order, the parameters are:
# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
float64[36] covariance

================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :my_sphero_actions/record_odomResult "cd453c62b66583c68284da7f017a9a0c")

