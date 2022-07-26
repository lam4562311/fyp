;; Auto-generated. Do not edit!


(when (boundp 'ps4_bot::GpsCompass)
  (if (not (find-package "PS4_BOT"))
    (make-package "PS4_BOT"))
  (shadow 'GpsCompass (find-package "PS4_BOT")))
(unless (find-package "PS4_BOT::GPSCOMPASS")
  (make-package "PS4_BOT::GPSCOMPASS"))
(unless (find-package "PS4_BOT::GPSCOMPASSREQUEST")
  (make-package "PS4_BOT::GPSCOMPASSREQUEST"))
(unless (find-package "PS4_BOT::GPSCOMPASSRESPONSE")
  (make-package "PS4_BOT::GPSCOMPASSRESPONSE"))

(in-package "ROS")

(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(if (not (find-package "GEOGRAPHIC_MSGS"))
  (ros::roseus-add-msgs "geographic_msgs"))


(defclass ps4_bot::GpsCompassRequest
  :super ros::object
  :slots (_request ))

(defmethod ps4_bot::GpsCompassRequest
  (:init
   (&key
    ((:request __request) (instance std_msgs::Empty :init))
    )
   (send-super :init)
   (setq _request __request)
   self)
  (:request
   (&rest __request)
   (if (keywordp (car __request))
       (send* _request __request)
     (progn
       (if __request (setq _request (car __request)))
       _request)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Empty _request
    (send _request :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Empty _request
       (send _request :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Empty _request
     (send _request :deserialize buf ptr-) (incf ptr- (send _request :serialization-length))
   ;;
   self)
  )

(defclass ps4_bot::GpsCompassResponse
  :super ros::object
  :slots (_position _angle ))

(defmethod ps4_bot::GpsCompassResponse
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

(defclass ps4_bot::GpsCompass
  :super ros::object
  :slots ())

(setf (get ps4_bot::GpsCompass :md5sum-) "b232e5ea178ff58767787805c24ec2f6")
(setf (get ps4_bot::GpsCompass :datatype-) "ps4_bot/GpsCompass")
(setf (get ps4_bot::GpsCompass :request) ps4_bot::GpsCompassRequest)
(setf (get ps4_bot::GpsCompass :response) ps4_bot::GpsCompassResponse)

(defmethod ps4_bot::GpsCompassRequest
  (:response () (instance ps4_bot::GpsCompassResponse :init)))

(setf (get ps4_bot::GpsCompassRequest :md5sum-) "b232e5ea178ff58767787805c24ec2f6")
(setf (get ps4_bot::GpsCompassRequest :datatype-) "ps4_bot/GpsCompassRequest")
(setf (get ps4_bot::GpsCompassRequest :definition-)
      "#Empty msg for request
std_msgs/Empty request

================================================================================
MSG: std_msgs/Empty
---

#current position of client
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

(setf (get ps4_bot::GpsCompassResponse :md5sum-) "b232e5ea178ff58767787805c24ec2f6")
(setf (get ps4_bot::GpsCompassResponse :datatype-) "ps4_bot/GpsCompassResponse")
(setf (get ps4_bot::GpsCompassResponse :definition-)
      "#Empty msg for request
std_msgs/Empty request

================================================================================
MSG: std_msgs/Empty
---

#current position of client
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



(provide :ps4_bot/GpsCompass "b232e5ea178ff58767787805c24ec2f6")


