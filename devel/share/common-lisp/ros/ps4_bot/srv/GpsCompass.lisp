; Auto-generated. Do not edit!


(cl:in-package ps4_bot-srv)


;//! \htmlinclude GpsCompass-request.msg.html

(cl:defclass <GpsCompass-request> (roslisp-msg-protocol:ros-message)
  ((request
    :reader request
    :initarg :request
    :type std_msgs-msg:Empty
    :initform (cl:make-instance 'std_msgs-msg:Empty)))
)

(cl:defclass GpsCompass-request (<GpsCompass-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GpsCompass-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GpsCompass-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ps4_bot-srv:<GpsCompass-request> is deprecated: use ps4_bot-srv:GpsCompass-request instead.")))

(cl:ensure-generic-function 'request-val :lambda-list '(m))
(cl:defmethod request-val ((m <GpsCompass-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ps4_bot-srv:request-val is deprecated.  Use ps4_bot-srv:request instead.")
  (request m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GpsCompass-request>) ostream)
  "Serializes a message object of type '<GpsCompass-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'request) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GpsCompass-request>) istream)
  "Deserializes a message object of type '<GpsCompass-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'request) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GpsCompass-request>)))
  "Returns string type for a service object of type '<GpsCompass-request>"
  "ps4_bot/GpsCompassRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GpsCompass-request)))
  "Returns string type for a service object of type 'GpsCompass-request"
  "ps4_bot/GpsCompassRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GpsCompass-request>)))
  "Returns md5sum for a message object of type '<GpsCompass-request>"
  "b232e5ea178ff58767787805c24ec2f6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GpsCompass-request)))
  "Returns md5sum for a message object of type 'GpsCompass-request"
  "b232e5ea178ff58767787805c24ec2f6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GpsCompass-request>)))
  "Returns full string definition for message of type '<GpsCompass-request>"
  (cl:format cl:nil "#Empty msg for request~%std_msgs/Empty request~%~%================================================================================~%MSG: std_msgs/Empty~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GpsCompass-request)))
  "Returns full string definition for message of type 'GpsCompass-request"
  (cl:format cl:nil "#Empty msg for request~%std_msgs/Empty request~%~%================================================================================~%MSG: std_msgs/Empty~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GpsCompass-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'request))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GpsCompass-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GpsCompass-request
    (cl:cons ':request (request msg))
))
;//! \htmlinclude GpsCompass-response.msg.html

(cl:defclass <GpsCompass-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass GpsCompass-response (<GpsCompass-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GpsCompass-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GpsCompass-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ps4_bot-srv:<GpsCompass-response> is deprecated: use ps4_bot-srv:GpsCompass-response instead.")))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <GpsCompass-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ps4_bot-srv:position-val is deprecated.  Use ps4_bot-srv:position instead.")
  (position m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <GpsCompass-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ps4_bot-srv:angle-val is deprecated.  Use ps4_bot-srv:angle instead.")
  (angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GpsCompass-response>) ostream)
  "Serializes a message object of type '<GpsCompass-response>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GpsCompass-response>) istream)
  "Deserializes a message object of type '<GpsCompass-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GpsCompass-response>)))
  "Returns string type for a service object of type '<GpsCompass-response>"
  "ps4_bot/GpsCompassResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GpsCompass-response)))
  "Returns string type for a service object of type 'GpsCompass-response"
  "ps4_bot/GpsCompassResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GpsCompass-response>)))
  "Returns md5sum for a message object of type '<GpsCompass-response>"
  "b232e5ea178ff58767787805c24ec2f6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GpsCompass-response)))
  "Returns md5sum for a message object of type 'GpsCompass-response"
  "b232e5ea178ff58767787805c24ec2f6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GpsCompass-response>)))
  "Returns full string definition for message of type '<GpsCompass-response>"
  (cl:format cl:nil "~%#current position of client~%geographic_msgs/GeoPoint position~%~%#current orientation based on compass North(degree)~%float64 angle~%~%================================================================================~%MSG: geographic_msgs/GeoPoint~%# Geographic point, using the WGS 84 reference ellipsoid.~%~%# Latitude [degrees]. Positive is north of equator; negative is south~%# (-90 <= latitude <= +90).~%float64 latitude~%~%# Longitude [degrees]. Positive is east of prime meridian; negative is~%# west (-180 <= longitude <= +180). At the poles, latitude is -90 or~%# +90, and longitude is irrelevant, but must be in range.~%float64 longitude~%~%# Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).~%float64 altitude~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GpsCompass-response)))
  "Returns full string definition for message of type 'GpsCompass-response"
  (cl:format cl:nil "~%#current position of client~%geographic_msgs/GeoPoint position~%~%#current orientation based on compass North(degree)~%float64 angle~%~%================================================================================~%MSG: geographic_msgs/GeoPoint~%# Geographic point, using the WGS 84 reference ellipsoid.~%~%# Latitude [degrees]. Positive is north of equator; negative is south~%# (-90 <= latitude <= +90).~%float64 latitude~%~%# Longitude [degrees]. Positive is east of prime meridian; negative is~%# west (-180 <= longitude <= +180). At the poles, latitude is -90 or~%# +90, and longitude is irrelevant, but must be in range.~%float64 longitude~%~%# Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).~%float64 altitude~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GpsCompass-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GpsCompass-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GpsCompass-response
    (cl:cons ':position (position msg))
    (cl:cons ':angle (angle msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GpsCompass)))
  'GpsCompass-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GpsCompass)))
  'GpsCompass-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GpsCompass)))
  "Returns string type for a service object of type '<GpsCompass>"
  "ps4_bot/GpsCompass")