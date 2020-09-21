; Auto-generated. Do not edit!


(cl:in-package bb8_custom-srv)


;//! \htmlinclude bb_msg-request.msg.html

(cl:defclass <bb_msg-request> (roslisp-msg-protocol:ros-message)
  ((duration
    :reader duration
    :initarg :duration
    :type cl:integer
    :initform 0))
)

(cl:defclass bb_msg-request (<bb_msg-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <bb_msg-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'bb_msg-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bb8_custom-srv:<bb_msg-request> is deprecated: use bb8_custom-srv:bb_msg-request instead.")))

(cl:ensure-generic-function 'duration-val :lambda-list '(m))
(cl:defmethod duration-val ((m <bb_msg-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bb8_custom-srv:duration-val is deprecated.  Use bb8_custom-srv:duration instead.")
  (duration m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <bb_msg-request>) ostream)
  "Serializes a message object of type '<bb_msg-request>"
  (cl:let* ((signed (cl:slot-value msg 'duration)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <bb_msg-request>) istream)
  "Deserializes a message object of type '<bb_msg-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'duration) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<bb_msg-request>)))
  "Returns string type for a service object of type '<bb_msg-request>"
  "bb8_custom/bb_msgRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'bb_msg-request)))
  "Returns string type for a service object of type 'bb_msg-request"
  "bb8_custom/bb_msgRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<bb_msg-request>)))
  "Returns md5sum for a message object of type '<bb_msg-request>"
  "b92c952a9248b3029cefe45f52f6ffde")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'bb_msg-request)))
  "Returns md5sum for a message object of type 'bb_msg-request"
  "b92c952a9248b3029cefe45f52f6ffde")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<bb_msg-request>)))
  "Returns full string definition for message of type '<bb_msg-request>"
  (cl:format cl:nil "int32 duration~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'bb_msg-request)))
  "Returns full string definition for message of type 'bb_msg-request"
  (cl:format cl:nil "int32 duration~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <bb_msg-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <bb_msg-request>))
  "Converts a ROS message object to a list"
  (cl:list 'bb_msg-request
    (cl:cons ':duration (duration msg))
))
;//! \htmlinclude bb_msg-response.msg.html

(cl:defclass <bb_msg-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass bb_msg-response (<bb_msg-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <bb_msg-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'bb_msg-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bb8_custom-srv:<bb_msg-response> is deprecated: use bb8_custom-srv:bb_msg-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <bb_msg-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bb8_custom-srv:success-val is deprecated.  Use bb8_custom-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <bb_msg-response>) ostream)
  "Serializes a message object of type '<bb_msg-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <bb_msg-response>) istream)
  "Deserializes a message object of type '<bb_msg-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<bb_msg-response>)))
  "Returns string type for a service object of type '<bb_msg-response>"
  "bb8_custom/bb_msgResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'bb_msg-response)))
  "Returns string type for a service object of type 'bb_msg-response"
  "bb8_custom/bb_msgResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<bb_msg-response>)))
  "Returns md5sum for a message object of type '<bb_msg-response>"
  "b92c952a9248b3029cefe45f52f6ffde")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'bb_msg-response)))
  "Returns md5sum for a message object of type 'bb_msg-response"
  "b92c952a9248b3029cefe45f52f6ffde")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<bb_msg-response>)))
  "Returns full string definition for message of type '<bb_msg-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'bb_msg-response)))
  "Returns full string definition for message of type 'bb_msg-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <bb_msg-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <bb_msg-response>))
  "Converts a ROS message object to a list"
  (cl:list 'bb_msg-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'bb_msg)))
  'bb_msg-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'bb_msg)))
  'bb_msg-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'bb_msg)))
  "Returns string type for a service object of type '<bb_msg>"
  "bb8_custom/bb_msg")