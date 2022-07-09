; Auto-generated. Do not edit!


(cl:in-package ps4-bot-msg)


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
    :initform (cl:make-instance 'geographic_msgs-msg:GeoPoint)))
)

(cl:defclass Navigation (<Navigation>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Navigation>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Navigation)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ps4-bot-msg:<Navigation> is deprecated: use ps4-bot-msg:Navigation instead.")))

(cl:ensure-generic-function 'start-val :lambda-list '(m))
(cl:defmethod start-val ((m <Navigation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ps4-bot-msg:start-val is deprecated.  Use ps4-bot-msg:start instead.")
  (start m))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <Navigation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ps4-bot-msg:goal-val is deprecated.  Use ps4-bot-msg:goal instead.")
  (goal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Navigation>) ostream)
  "Serializes a message object of type '<Navigation>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'start) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'goal) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Navigation>) istream)
  "Deserializes a message object of type '<Navigation>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'start) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'goal) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Navigation>)))
  "Returns string type for a message object of type '<Navigation>"
  "ps4-bot/Navigation")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Navigation)))
  "Returns string type for a message object of type 'Navigation"
  "ps4-bot/Navigation")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Navigation>)))
  "Returns md5sum for a message object of type '<Navigation>"
  "cad6de11e4ae4ca568785186e1f99f89")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Navigation)))
  "Returns md5sum for a message object of type 'Navigation"
  "cad6de11e4ae4ca568785186e1f99f89")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Navigation>)))
  "Returns full string definition for message of type '<Navigation>"
  (cl:format cl:nil "#Recording the start and goal of the navigation~%~%#lat lng of start position~%geographic_msgs/GeoPoint start~%~%#lat lng of goal position~%geographic_msgs/GeoPoint goal~%~%================================================================================~%MSG: geographic_msgs/GeoPoint~%# Geographic point, using the WGS 84 reference ellipsoid.~%~%# Latitude [degrees]. Positive is north of equator; negative is south~%# (-90 <= latitude <= +90).~%float64 latitude~%~%# Longitude [degrees]. Positive is east of prime meridian; negative is~%# west (-180 <= longitude <= +180). At the poles, latitude is -90 or~%# +90, and longitude is irrelevant, but must be in range.~%float64 longitude~%~%# Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).~%float64 altitude~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Navigation)))
  "Returns full string definition for message of type 'Navigation"
  (cl:format cl:nil "#Recording the start and goal of the navigation~%~%#lat lng of start position~%geographic_msgs/GeoPoint start~%~%#lat lng of goal position~%geographic_msgs/GeoPoint goal~%~%================================================================================~%MSG: geographic_msgs/GeoPoint~%# Geographic point, using the WGS 84 reference ellipsoid.~%~%# Latitude [degrees]. Positive is north of equator; negative is south~%# (-90 <= latitude <= +90).~%float64 latitude~%~%# Longitude [degrees]. Positive is east of prime meridian; negative is~%# west (-180 <= longitude <= +180). At the poles, latitude is -90 or~%# +90, and longitude is irrelevant, but must be in range.~%float64 longitude~%~%# Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).~%float64 altitude~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Navigation>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'start))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'goal))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Navigation>))
  "Converts a ROS message object to a list"
  (cl:list 'Navigation
    (cl:cons ':start (start msg))
    (cl:cons ':goal (goal msg))
))
