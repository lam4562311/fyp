;; Auto-generated. Do not edit!


(when (boundp 'ps4-bot::Navigation)
  (if (not (find-package "PS4-BOT"))
    (make-package "PS4-BOT"))
  (shadow 'Navigation (find-package "PS4-BOT")))
(unless (find-package "PS4-BOT::NAVIGATION")
  (make-package "PS4-BOT::NAVIGATION"))

(in-package "ROS")
;;//! \htmlinclude Navigation.msg.html
(if (not (find-package "GEOGRAPHIC_MSGS"))
  (ros::roseus-add-msgs "geographic_msgs"))


(defclass ps4-bot::Navigation
  :super ros::object
  :slots (_start _goal ))

(defmethod ps4-bot::Navigation
  (:init
   (&key
    ((:start __start) (instance geographic_msgs::GeoPoint :init))
    ((:goal __goal) (instance geographic_msgs::GeoPoint :init))
    )
   (send-super :init)
   (setq _start __start)
   (setq _goal __goal)
   self)
  (:start
   (&rest __start)
   (if (keywordp (car __start))
       (send* _start __start)
     (progn
       (if __start (setq _start (car __start)))
       _start)))
  (:goal
   (&rest __goal)
   (if (keywordp (car __goal))
       (send* _goal __goal)
     (progn
       (if __goal (setq _goal (car __goal)))
       _goal)))
  (:serialization-length
   ()
   (+
    ;; geographic_msgs/GeoPoint _start
    (send _start :serialization-length)
    ;; geographic_msgs/GeoPoint _goal
    (send _goal :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geographic_msgs/GeoPoint _start
       (send _start :serialize s)
     ;; geographic_msgs/GeoPoint _goal
       (send _goal :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geographic_msgs/GeoPoint _start
     (send _start :deserialize buf ptr-) (incf ptr- (send _start :serialization-length))
   ;; geographic_msgs/GeoPoint _goal
     (send _goal :deserialize buf ptr-) (incf ptr- (send _goal :serialization-length))
   ;;
   self)
  )

(setf (get ps4-bot::Navigation :md5sum-) "cad6de11e4ae4ca568785186e1f99f89")
(setf (get ps4-bot::Navigation :datatype-) "ps4-bot/Navigation")
(setf (get ps4-bot::Navigation :definition-)
      "#Recording the start and goal of the navigation

#lat lng of start position
geographic_msgs/GeoPoint start

#lat lng of goal position
geographic_msgs/GeoPoint goal

================================================================================
MSG: geographic_msgs/GeoPoint
# Geographic point, using the WGS 84 reference ellipsoid.

# Latitude [degrees]. Positive is north of equator; negative is south
# (-90 <= latitude <= +90).
float64 latitude

# Longitude [degrees]. Positive is east of prime meridian; negative is
# west (-180 <= longitude <= +180). At the poles, latitude is -90 or
# +90, and longitude is irrelevant, but must be in range.
float64 longitude

# Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).
float64 altitude

")



(provide :ps4-bot/Navigation "cad6de11e4ae4ca568785186e1f99f89")


