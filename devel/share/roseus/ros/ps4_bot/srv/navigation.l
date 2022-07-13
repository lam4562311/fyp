;; Auto-generated. Do not edit!


(when (boundp 'ps4_bot::navigation)
  (if (not (find-package "PS4_BOT"))
    (make-package "PS4_BOT"))
  (shadow 'navigation (find-package "PS4_BOT")))
(unless (find-package "PS4_BOT::NAVIGATION")
  (make-package "PS4_BOT::NAVIGATION"))
(unless (find-package "PS4_BOT::NAVIGATIONREQUEST")
  (make-package "PS4_BOT::NAVIGATIONREQUEST"))
(unless (find-package "PS4_BOT::NAVIGATIONRESPONSE")
  (make-package "PS4_BOT::NAVIGATIONRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOGRAPHIC_MSGS"))
  (ros::roseus-add-msgs "geographic_msgs"))




(defclass ps4_bot::navigationRequest
  :super ros::object
  :slots (_start _goal _boundary _center _polygons _navigation_status ))

(defmethod ps4_bot::navigationRequest
  (:init
   (&key
    ((:start __start) (instance geographic_msgs::GeoPoint :init))
    ((:goal __goal) (instance geographic_msgs::GeoPoint :init))
    ((:boundary __boundary) (instance geographic_msgs::BoundingBox :init))
    ((:center __center) (instance geographic_msgs::GeoPoint :init))
    ((:polygons __polygons) ())
    ((:navigation_status __navigation_status) nil)
    )
   (send-super :init)
   (setq _start __start)
   (setq _goal __goal)
   (setq _boundary __boundary)
   (setq _center __center)
   (setq _polygons __polygons)
   (setq _navigation_status __navigation_status)
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
  (:boundary
   (&rest __boundary)
   (if (keywordp (car __boundary))
       (send* _boundary __boundary)
     (progn
       (if __boundary (setq _boundary (car __boundary)))
       _boundary)))
  (:center
   (&rest __center)
   (if (keywordp (car __center))
       (send* _center __center)
     (progn
       (if __center (setq _center (car __center)))
       _center)))
  (:polygons
   (&rest __polygons)
   (if (keywordp (car __polygons))
       (send* _polygons __polygons)
     (progn
       (if __polygons (setq _polygons (car __polygons)))
       _polygons)))
  (:navigation_status
   (&optional (__navigation_status :null))
   (if (not (eq __navigation_status :null)) (setq _navigation_status __navigation_status)) _navigation_status)
  (:serialization-length
   ()
   (+
    ;; geographic_msgs/GeoPoint _start
    (send _start :serialization-length)
    ;; geographic_msgs/GeoPoint _goal
    (send _goal :serialization-length)
    ;; geographic_msgs/BoundingBox _boundary
    (send _boundary :serialization-length)
    ;; geographic_msgs/GeoPoint _center
    (send _center :serialization-length)
    ;; ps4_bot/vertices[] _polygons
    (apply #'+ (send-all _polygons :serialization-length)) 4
    ;; bool _navigation_status
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geographic_msgs/GeoPoint _start
       (send _start :serialize s)
     ;; geographic_msgs/GeoPoint _goal
       (send _goal :serialize s)
     ;; geographic_msgs/BoundingBox _boundary
       (send _boundary :serialize s)
     ;; geographic_msgs/GeoPoint _center
       (send _center :serialize s)
     ;; ps4_bot/vertices[] _polygons
     (write-long (length _polygons) s)
     (dolist (elem _polygons)
       (send elem :serialize s)
       )
     ;; bool _navigation_status
       (if _navigation_status (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geographic_msgs/GeoPoint _start
     (send _start :deserialize buf ptr-) (incf ptr- (send _start :serialization-length))
   ;; geographic_msgs/GeoPoint _goal
     (send _goal :deserialize buf ptr-) (incf ptr- (send _goal :serialization-length))
   ;; geographic_msgs/BoundingBox _boundary
     (send _boundary :deserialize buf ptr-) (incf ptr- (send _boundary :serialization-length))
   ;; geographic_msgs/GeoPoint _center
     (send _center :deserialize buf ptr-) (incf ptr- (send _center :serialization-length))
   ;; ps4_bot/vertices[] _polygons
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _polygons (let (r) (dotimes (i n) (push (instance ps4_bot::vertices :init) r)) r))
     (dolist (elem- _polygons)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; bool _navigation_status
     (setq _navigation_status (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass ps4_bot::navigationResponse
  :super ros::object
  :slots (_polylines ))

(defmethod ps4_bot::navigationResponse
  (:init
   (&key
    ((:polylines __polylines) (instance ps4_bot::vertices :init))
    )
   (send-super :init)
   (setq _polylines __polylines)
   self)
  (:polylines
   (&rest __polylines)
   (if (keywordp (car __polylines))
       (send* _polylines __polylines)
     (progn
       (if __polylines (setq _polylines (car __polylines)))
       _polylines)))
  (:serialization-length
   ()
   (+
    ;; ps4_bot/vertices _polylines
    (send _polylines :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; ps4_bot/vertices _polylines
       (send _polylines :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; ps4_bot/vertices _polylines
     (send _polylines :deserialize buf ptr-) (incf ptr- (send _polylines :serialization-length))
   ;;
   self)
  )

(defclass ps4_bot::navigation
  :super ros::object
  :slots ())

(setf (get ps4_bot::navigation :md5sum-) "2898f1f22432733d25df2f4d710eb4f7")
(setf (get ps4_bot::navigation :datatype-) "ps4_bot/navigation")
(setf (get ps4_bot::navigation :request) ps4_bot::navigationRequest)
(setf (get ps4_bot::navigation :response) ps4_bot::navigationResponse)

(defmethod ps4_bot::navigationRequest
  (:response () (instance ps4_bot::navigationResponse :init)))

(setf (get ps4_bot::navigationRequest :md5sum-) "2898f1f22432733d25df2f4d710eb4f7")
(setf (get ps4_bot::navigationRequest :datatype-) "ps4_bot/navigationRequest")
(setf (get ps4_bot::navigationRequest :definition-)
      "#Recording the start and goal of the navigation

#lat lng of start position
geographic_msgs/GeoPoint start

#lat lng of goal position
geographic_msgs/GeoPoint goal

#boundary of control zone
#min SW
#max NE
geographic_msgs/BoundingBox boundary
geographic_msgs/GeoPoint center

#list of vertices
ps4_bot/vertices[] polygons

bool navigation_status


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

================================================================================
MSG: geographic_msgs/BoundingBox
# Geographic map bounding box. 
#
# The two GeoPoints denote diagonally opposite corners of the box.
#
# If min_pt.latitude is NaN, the bounding box is \"global\", matching
# any valid latitude, longitude and altitude.
#
# If min_pt.altitude is NaN, the bounding box is two-dimensional and
# matches any altitude within the specified latitude and longitude
# range.

GeoPoint min_pt         # lowest and most Southwestern corner
GeoPoint max_pt         # highest and most Northeastern corner

================================================================================
MSG: ps4_bot/vertices
#list of GeoPoint
---

ps4_bot/vertices polylines

================================================================================
MSG: ps4_bot/vertices
#list of GeoPoint
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

(setf (get ps4_bot::navigationResponse :md5sum-) "2898f1f22432733d25df2f4d710eb4f7")
(setf (get ps4_bot::navigationResponse :datatype-) "ps4_bot/navigationResponse")
(setf (get ps4_bot::navigationResponse :definition-)
      "#Recording the start and goal of the navigation

#lat lng of start position
geographic_msgs/GeoPoint start

#lat lng of goal position
geographic_msgs/GeoPoint goal

#boundary of control zone
#min SW
#max NE
geographic_msgs/BoundingBox boundary
geographic_msgs/GeoPoint center

#list of vertices
ps4_bot/vertices[] polygons

bool navigation_status


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

================================================================================
MSG: geographic_msgs/BoundingBox
# Geographic map bounding box. 
#
# The two GeoPoints denote diagonally opposite corners of the box.
#
# If min_pt.latitude is NaN, the bounding box is \"global\", matching
# any valid latitude, longitude and altitude.
#
# If min_pt.altitude is NaN, the bounding box is two-dimensional and
# matches any altitude within the specified latitude and longitude
# range.

GeoPoint min_pt         # lowest and most Southwestern corner
GeoPoint max_pt         # highest and most Northeastern corner

================================================================================
MSG: ps4_bot/vertices
#list of GeoPoint
---

ps4_bot/vertices polylines

================================================================================
MSG: ps4_bot/vertices
#list of GeoPoint
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



(provide :ps4_bot/navigation "2898f1f22432733d25df2f4d710eb4f7")


