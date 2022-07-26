;; Auto-generated. Do not edit!


(when (boundp 'ps4_bot::gps_compass)
  (if (not (find-package "PS4_BOT"))
    (make-package "PS4_BOT"))
  (shadow 'gps_compass (find-package "PS4_BOT")))
(unless (find-package "PS4_BOT::GPS_COMPASS")
  (make-package "PS4_BOT::GPS_COMPASS"))

(in-package "ROS")
;;//! \htmlinclude gps_compass.msg.html
(if (not (find-package "GEOGRAPHIC_MSGS"))
  (ros::roseus-add-msgs "geographic_msgs"))


(defclass ps4_bot::gps_compass
  :super ros::object
  :slots (_position _angle ))

(defmethod ps4_bot::gps_compass
  (:init
   (&key
    ((:position __position) (instance geographic_msgs::GeoPoint :init))
    ((:angle __angle) 0.0)
    )
   (send-super :init)
   (setq _position __position)
   (setq _angle (float __angle))
   self)
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:serialization-length
   ()
   (+
    ;; geographic_msgs/GeoPoint _position
    (send _position :serialization-length)
    ;; float64 _angle
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geographic_msgs/GeoPoint _position
       (send _position :serialize s)
     ;; float64 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geographic_msgs/GeoPoint _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;; float64 _angle
     (setq _angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get ps4_bot::gps_compass :md5sum-) "6d2cef402af49fe31c4825156ee1a6e2")
(setf (get ps4_bot::gps_compass :datatype-) "ps4_bot/gps_compass")
(setf (get ps4_bot::gps_compass :definition-)
      "#current position of client
geographic_msgs/GeoPoint position

#current orientation based on compass North(degree)
float64 angle
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



(provide :ps4_bot/gps_compass "6d2cef402af49fe31c4825156ee1a6e2")


