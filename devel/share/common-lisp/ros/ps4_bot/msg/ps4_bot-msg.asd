
(cl:in-package :asdf)

(defsystem "ps4_bot-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geographic_msgs-msg
)
  :components ((:file "_package")
    (:file "Navigation" :depends-on ("_package_Navigation"))
    (:file "_package_Navigation" :depends-on ("_package"))
    (:file "gps_compass" :depends-on ("_package_gps_compass"))
    (:file "_package_gps_compass" :depends-on ("_package"))
    (:file "vertices" :depends-on ("_package_vertices"))
    (:file "_package_vertices" :depends-on ("_package"))
  ))