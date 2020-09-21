
(cl:in-package :asdf)

(defsystem "bb8_custom-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "BB8CustomServiceMessage" :depends-on ("_package_BB8CustomServiceMessage"))
    (:file "_package_BB8CustomServiceMessage" :depends-on ("_package"))
    (:file "bb_msg" :depends-on ("_package_bb_msg"))
    (:file "_package_bb_msg" :depends-on ("_package"))
  ))