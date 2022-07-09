
(cl:in-package :asdf)

(defsystem "ps4-bot-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geographic_msgs-msg
)
  :components ((:file "_package")
    (:file "Navigation" :depends-on ("_package_Navigation"))
    (:file "_package_Navigation" :depends-on ("_package"))
  ))