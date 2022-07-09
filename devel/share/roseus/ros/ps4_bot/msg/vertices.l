;; Auto-generated. Do not edit!


(when (boundp 'ps4_bot::vertices)
  (if (not (find-package "PS4_BOT"))
    (make-package "PS4_BOT"))
  (shadow 'vertices (find-package "PS4_BOT")))
(unless (find-package "PS4_BOT::VERTICES")
  (make-package "PS4_BOT::VERTICES"))

(in-package "ROS")
;;//! \htmlinclude vertices.msg.html
(if (not (find-package "GEOGRAPHIC_MSGS"))
  (ros::roseus-add-msgs "geographic_msgs"))


(defclass ps4_bot::vertices
  :super ros::object
  :slots (_vertices ))

(defmethod ps4_bot::vertices
  (:init
   (&key
    ((:vertices __vertices) ())
    )
   (send-super :init)
   (setq _vertices __vertices)
   self)
  (:vertices
   (&rest __vertices)
   (if (keywordp (car __vertices))
       (send* _vertices __vertices)
     (progn
       (if __vertices (setq _vertices (car __vertices)))
       _vertices)))
  (:serialization-length
   ()
   (+
    ;; geographic_msgs/GeoPoint[] _vertices
    (apply #'+ (send-all _vertices :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geographic_msgs/GeoPoint[] _vertices
     (write-long (length _vertices) s)
     (dolist (elem _vertices)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geographic_msgs/GeoPoint[] _vertices
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _vertices (let (r) (dotimes (i n) (push (instance geographic_msgs::GeoPoint :init) r)) r))
     (dolist (elem- _vertices)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get ps4_bot::vertices :md5sum-) "b1ad020a43453ed5acef914e15c95da8")
(setf (get ps4_bot::vertices :datatype-) "ps4_bot/vertices")
(setf (get ps4_bot::vertices :definition-)
      "#list of GeoPoint
geographic_msgs/GeoPoint[] vertices
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



(provide :ps4_bot/vertices "b1ad020a43453ed5acef914e15c95da8")


