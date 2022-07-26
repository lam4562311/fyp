; Auto-generated. Do not edit!


(cl:in-package ps4_bot-msg)


;//! \htmlinclude gps_compass.msg.html

(cl:defclass <gps_compass> (roslisp-msg-protocol:ros-message)
  ((position
    :reader position
    :initarg :position
    :type geographic_msgs-msg:GeoPoint
    :initform (cl:make-instance 'geographic_msgs-msg:GeoPoint))
   (angle
    :reader angle
    :initarg :angle
    :type cl:float
    :initform 0.0))
)

(cl:defclass gps_compass (<gps_compass>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <gps_compass>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'gps_compass)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ps4_bot-msg:<gps_compass> is deprecated: use ps4_bot-msg:gps_compass instead.")))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <gps_compass>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ps4_bot-msg:position-val is deprecated.  Use ps4_bot-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <gps_compass>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ps4_bot-msg:angle-val is deprecated.  Use ps4_bot-msg:angle instead.")
  (angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <gps_compass>) ostream)
  "Serializes a message object of type '<gps_compass>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <gps_compass>) istream)
  "Deserializes a message object of type '<gps_compass>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<gps_compass>)))
  "Returns string type for a message object of type '<gps_compass>"
  "ps4_bot/gps_compass")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'gps_compass)))
  "Returns string type for a message object of type 'gps_compass"
  "ps4_bot/gps_compass")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<gps_compass>)))
  "Returns md5sum for a message object of type '<gps_compass>"
  "6d2cef402af49fe31c4825156ee1a6e2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'gps_compass)))
  "Returns md5sum for a message object of type 'gps_compass"
  "6d2cef402af49fe31c4825156ee1a6e2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<gps_compass>)))
  "Returns full string definition for message of type '<gps_compass>"
  (cl:format cl:nil "#current position of client~%geographic_msgs/GeoPoint position~%~%#current orientation based on compass North(degree)~%float64 angle~%================================================================================~%MSG: geographic_msgs/GeoPoint~%# Geographic point, using the WGS 84 reference ellipsoid.~%~%# Latitude [degrees]. Positive is north of equator; negative is south~%# (-90 <= latitude <= +90).~%float64 latitude~%~%# Longitude [degrees]. Positive is east of prime meridian; negative is~%# west (-180 <= longitude <= +180). At the poles, latitude is -90 or~%# +90, and longitude is irrelevant, but must be in range.~%float64 longitude~%~%# Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).~%float64 altitude~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'gps_compass)))
  "Returns full string definition for message of type 'gps_compass"
  (cl:format cl:nil "#current position of client~%geographic_msgs/GeoPoint position~%~%#current orientation based on compass North(degree)~%float64 angle~%================================================================================~%MSG: geographic_msgs/GeoPoint~%# Geographic point, using the WGS 84 reference ellipsoid.~%~%# Latitude [degrees]. Positive is north of equator; negative is south~%# (-90 <= latitude <= +90).~%float64 latitude~%~%# Longitude [degrees]. Positive is east of prime meridian; negative is~%# west (-180 <= longitude <= +180). At the poles, latitude is -90 or~%# +90, and longitude is irrelevant, but must be in range.~%float64 longitude~%~%# Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).~%float64 altitude~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <gps_compass>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <gps_compass>))
  "Converts a ROS message object to a list"
  (cl:list 'gps_compass
    (cl:cons ':position (position msg))
    (cl:cons ':angle (angle msg))
))
