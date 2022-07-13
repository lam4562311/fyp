
(cl:in-package :asdf)

(defsystem "ps4_bot-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geographic_msgs-msg
               :ps4_bot-msg
)
  :components ((:file "_package")
    (:file "AddtwoInts" :depends-on ("_package_AddtwoInts"))
    (:file "_package_AddtwoInts" :depends-on ("_package"))
    (:file "navigation" :depends-on ("_package_navigation"))
    (:file "_package_navigation" :depends-on ("_package"))
  ))