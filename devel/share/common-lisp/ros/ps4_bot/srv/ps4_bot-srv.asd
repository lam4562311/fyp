
(cl:in-package :asdf)

(defsystem "ps4_bot-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geographic_msgs-msg
               :ps4_bot-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "GpsCompass" :depends-on ("_package_GpsCompass"))
    (:file "_package_GpsCompass" :depends-on ("_package"))
    (:file "navigation" :depends-on ("_package_navigation"))
    (:file "_package_navigation" :depends-on ("_package"))
    (:file "processing_nav" :depends-on ("_package_processing_nav"))
    (:file "_package_processing_nav" :depends-on ("_package"))
  ))