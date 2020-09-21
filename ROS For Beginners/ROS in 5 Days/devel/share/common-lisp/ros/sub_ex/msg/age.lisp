; Auto-generated. Do not edit!


(cl:in-package sub_ex-msg)


;//! \htmlinclude age.msg.html

(cl:defclass <age> (roslisp-msg-protocol:ros-message)
  ((years
    :reader years
    :initarg :years
    :type cl:float
    :initform 0.0)
   (months
    :reader months
    :initarg :months
    :type cl:float
    :initform 0.0)
   (days
    :reader days
    :initarg :days
    :type cl:float
    :initform 0.0))
)

(cl:defclass age (<age>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <age>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'age)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sub_ex-msg:<age> is deprecated: use sub_ex-msg:age instead.")))

(cl:ensure-generic-function 'years-val :lambda-list '(m))
(cl:defmethod years-val ((m <age>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sub_ex-msg:years-val is deprecated.  Use sub_ex-msg:years instead.")
  (years m))

(cl:ensure-generic-function 'months-val :lambda-list '(m))
(cl:defmethod months-val ((m <age>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sub_ex-msg:months-val is deprecated.  Use sub_ex-msg:months instead.")
  (months m))

(cl:ensure-generic-function 'days-val :lambda-list '(m))
(cl:defmethod days-val ((m <age>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sub_ex-msg:days-val is deprecated.  Use sub_ex-msg:days instead.")
  (days m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <age>) ostream)
  "Serializes a message object of type '<age>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'years))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'months))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'days))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <age>) istream)
  "Deserializes a message object of type '<age>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'years) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'months) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'days) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<age>)))
  "Returns string type for a message object of type '<age>"
  "sub_ex/age")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'age)))
  "Returns string type for a message object of type 'age"
  "sub_ex/age")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<age>)))
  "Returns md5sum for a message object of type '<age>"
  "e8088e290d061dabc94e1feafd4db363")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'age)))
  "Returns md5sum for a message object of type 'age"
  "e8088e290d061dabc94e1feafd4db363")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<age>)))
  "Returns full string definition for message of type '<age>"
  (cl:format cl:nil "float32 years~%float32 months~%float32 days~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'age)))
  "Returns full string definition for message of type 'age"
  (cl:format cl:nil "float32 years~%float32 months~%float32 days~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <age>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <age>))
  "Converts a ROS message object to a list"
  (cl:list 'age
    (cl:cons ':years (years msg))
    (cl:cons ':months (months msg))
    (cl:cons ':days (days msg))
))
