;; Auto-generated. Do not edit!


(when (boundp 'bb8_custom::bb_msg)
  (if (not (find-package "BB8_CUSTOM"))
    (make-package "BB8_CUSTOM"))
  (shadow 'bb_msg (find-package "BB8_CUSTOM")))
(unless (find-package "BB8_CUSTOM::BB_MSG")
  (make-package "BB8_CUSTOM::BB_MSG"))
(unless (find-package "BB8_CUSTOM::BB_MSGREQUEST")
  (make-package "BB8_CUSTOM::BB_MSGREQUEST"))
(unless (find-package "BB8_CUSTOM::BB_MSGRESPONSE")
  (make-package "BB8_CUSTOM::BB_MSGRESPONSE"))

(in-package "ROS")





(defclass bb8_custom::bb_msgRequest
  :super ros::object
  :slots (_duration ))

(defmethod bb8_custom::bb_msgRequest
  (:init
   (&key
    ((:duration __duration) 0)
    )
   (send-super :init)
   (setq _duration (round __duration))
   self)
  (:duration
   (&optional __duration)
   (if __duration (setq _duration __duration)) _duration)
  (:serialization-length
   ()
   (+
    ;; int32 _duration
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _duration
       (write-long _duration s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _duration
     (setq _duration (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass bb8_custom::bb_msgResponse
  :super ros::object
  :slots (_success ))

(defmethod bb8_custom::bb_msgResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass bb8_custom::bb_msg
  :super ros::object
  :slots ())

(setf (get bb8_custom::bb_msg :md5sum-) "b92c952a9248b3029cefe45f52f6ffde")
(setf (get bb8_custom::bb_msg :datatype-) "bb8_custom/bb_msg")
(setf (get bb8_custom::bb_msg :request) bb8_custom::bb_msgRequest)
(setf (get bb8_custom::bb_msg :response) bb8_custom::bb_msgResponse)

(defmethod bb8_custom::bb_msgRequest
  (:response () (instance bb8_custom::bb_msgResponse :init)))

(setf (get bb8_custom::bb_msgRequest :md5sum-) "b92c952a9248b3029cefe45f52f6ffde")
(setf (get bb8_custom::bb_msgRequest :datatype-) "bb8_custom/bb_msgRequest")
(setf (get bb8_custom::bb_msgRequest :definition-)
      "int32 duration
---
bool success

")

(setf (get bb8_custom::bb_msgResponse :md5sum-) "b92c952a9248b3029cefe45f52f6ffde")
(setf (get bb8_custom::bb_msgResponse :datatype-) "bb8_custom/bb_msgResponse")
(setf (get bb8_custom::bb_msgResponse :definition-)
      "int32 duration
---
bool success

")



(provide :bb8_custom/bb_msg "b92c952a9248b3029cefe45f52f6ffde")


