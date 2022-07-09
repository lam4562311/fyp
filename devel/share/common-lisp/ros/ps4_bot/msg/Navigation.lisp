; Auto-generated. Do not edit!


(cl:in-package ps4_bot-msg)


;//! \htmlinclude Navigation.msg.html

(cl:defclass <Navigation> (roslisp-msg-protocol:ros-message)
  ((start
    :reader start
    :initarg :start
    :type geographic_msgs-msg:GeoPoint
    :initform (cl:make-instance 'geographic_msgs-msg:GeoPoint))
   (goal
    :reader goal
    :initarg :goal
    :type geographic_msgs-msg:GeoPoint
    :initform (cl:make-instance 'geographic_msgs-msg:GeoPoint))
   (boundary
    :reader boundary
    :initarg :boundary
    :type geographic_msgs-msg:BoundingBox
    :initform (cl:make-instance 'geographic_msgs-msg:BoundingBox))
   (center
    :reader center
    :initarg :center
    :type geographic_msgs-msg:GeoPoint
    :initform (cl:make-instance 'geographic_msgs-msg:GeoPoint))
   (polygons
    :reader polygons
    :initarg :polygons
    :type (cl:vector ps4_bot-msg:vertices)
   :initform (cl:make-array 0 :element-type 'ps4_bot-msg:vertices :initial-element (cl:make-instance 'ps4_bot-msg:vertices)))
   (navigation_status
    :reader navigation_status
    :initarg :navigation_status
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Navigation (<Navigation>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Navigation>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Navigation)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ps4_bot-msg:<Navigation> is deprecated: use ps4_bot-msg:Navigation instead.")))

(cl:ensure-generic-function 'start-val :lambda-list '(m))
(cl:defmethod start-val ((m <Navigation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ps4_bot-msg:start-val is deprecated.  Use ps4_bot-msg:start instead.")
  (start m))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <Navigation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ps4_bot-msg:goal-val is deprecated.  Use ps4_bot-msg:goal instead.")
  (goal m))

(cl:ensure-generic-function 'boundary-val :lambda-list '(m))
(cl:defmethod boundary-val ((m <Navigation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ps4_bot-msg:boundary-val is deprecated.  Use ps4_bot-msg:boundary instead.")
  (boundary m))

(cl:ensure-generic-function 'center-val :lambda-list '(m))
(cl:defmethod center-val ((m <Navigation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ps4_bot-msg:center-val is deprecated.  Use ps4_bot-msg:center instead.")
  (center m))

(cl:ensure-generic-function 'polygons-val :lambda-list '(m))
(cl:defmethod polygons-val ((m <Navigation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ps4_bot-msg:polygons-val is deprecated.  Use ps4_bot-msg:polygons instead.")
  (polygons m))

(cl:ensure-generic-function 'navigation_status-val :lambda-list '(m))
(cl:defmethod navigation_status-val ((m <Navigation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ps4_bot-msg:navigation_status-val is deprecated.  Use ps4_bot-msg:navigation_status instead.")
  (navigation_status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Navigation>) ostream)
  "Serializes a message object of type '<Navigation>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'start) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'goal) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'boundary) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'center) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'polygons))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'polygons))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'navigation_status) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Navigation>) istream)
  "Deserializes a message object of type '<Navigation>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'start) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'goal) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'boundary) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'center) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'polygons) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'polygons)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ps4_bot-msg:vertices))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:setf (cl:slot-value msg 'navigation_status) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Navigation>)))
  "Returns string type for a message object of type '<Navigation>"
  "ps4_bot/Navigation")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Navigation)))
  "Returns string type for a message object of type 'Navigation"
  "ps4_bot/Navigation")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Navigation>)))
  "Returns md5sum for a message object of type '<Navigation>"
  "135fcffa3e2b8bd004214e3d13184e74")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Navigation)))
  "Returns md5sum for a message object of type 'Navigation"
  "135fcffa3e2b8bd004214e3d13184e74")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Navigation>)))
  "Returns full string definition for message of type '<Navigation>"
  (cl:format cl:nil "#Recording the start and goal of the navigation~%~%#lat lng of start position~%geographic_msgs/GeoPoint start~%~%#lat lng of goal position~%geographic_msgs/GeoPoint goal~%~%#boundary of control zone~%#min SW~%#max NE~%geographic_msgs/BoundingBox boundary~%geographic_msgs/GeoPoint center~%~%#list of vertices~%ps4_bot/vertices[] polygons~%~%bool navigation_status~%~%================================================================================~%MSG: geographic_msgs/GeoPoint~%# Geographic point, using the WGS 84 reference ellipsoid.~%~%# Latitude [degrees]. Positive is north of equator; negative is south~%# (-90 <= latitude <= +90).~%float64 latitude~%~%# Longitude [degrees]. Positive is east of prime meridian; negative is~%# west (-180 <= longitude <= +180). At the poles, latitude is -90 or~%# +90, and longitude is irrelevant, but must be in range.~%float64 longitude~%~%# Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).~%float64 altitude~%~%================================================================================~%MSG: geographic_msgs/BoundingBox~%# Geographic map bounding box. ~%#~%# The two GeoPoints denote diagonally opposite corners of the box.~%#~%# If min_pt.latitude is NaN, the bounding box is \"global\", matching~%# any valid latitude, longitude and altitude.~%#~%# If min_pt.altitude is NaN, the bounding box is two-dimensional and~%# matches any altitude within the specified latitude and longitude~%# range.~%~%GeoPoint min_pt         # lowest and most Southwestern corner~%GeoPoint max_pt         # highest and most Northeastern corner~%~%================================================================================~%MSG: ps4_bot/vertices~%#list of GeoPoint~%geographic_msgs/GeoPoint[] vertices~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Navigation)))
  "Returns full string definition for message of type 'Navigation"
  (cl:format cl:nil "#Recording the start and goal of the navigation~%~%#lat lng of start position~%geographic_msgs/GeoPoint start~%~%#lat lng of goal position~%geographic_msgs/GeoPoint goal~%~%#boundary of control zone~%#min SW~%#max NE~%geographic_msgs/BoundingBox boundary~%geographic_msgs/GeoPoint center~%~%#list of vertices~%ps4_bot/vertices[] polygons~%~%bool navigation_status~%~%================================================================================~%MSG: geographic_msgs/GeoPoint~%# Geographic point, using the WGS 84 reference ellipsoid.~%~%# Latitude [degrees]. Positive is north of equator; negative is south~%# (-90 <= latitude <= +90).~%float64 latitude~%~%# Longitude [degrees]. Positive is east of prime meridian; negative is~%# west (-180 <= longitude <= +180). At the poles, latitude is -90 or~%# +90, and longitude is irrelevant, but must be in range.~%float64 longitude~%~%# Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).~%float64 altitude~%~%================================================================================~%MSG: geographic_msgs/BoundingBox~%# Geographic map bounding box. ~%#~%# The two GeoPoints denote diagonally opposite corners of the box.~%#~%# If min_pt.latitude is NaN, the bounding box is \"global\", matching~%# any valid latitude, longitude and altitude.~%#~%# If min_pt.altitude is NaN, the bounding box is two-dimensional and~%# matches any altitude within the specified latitude and longitude~%# range.~%~%GeoPoint min_pt         # lowest and most Southwestern corner~%GeoPoint max_pt         # highest and most Northeastern corner~%~%================================================================================~%MSG: ps4_bot/vertices~%#list of GeoPoint~%geographic_msgs/GeoPoint[] vertices~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Navigation>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'start))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'goal))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'boundary))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'center))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'polygons) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Navigation>))
  "Converts a ROS message object to a list"
  (cl:list 'Navigation
    (cl:cons ':start (start msg))
    (cl:cons ':goal (goal msg))
    (cl:cons ':boundary (boundary msg))
    (cl:cons ':center (center msg))
    (cl:cons ':polygons (polygons msg))
    (cl:cons ':navigation_status (navigation_status msg))
))
