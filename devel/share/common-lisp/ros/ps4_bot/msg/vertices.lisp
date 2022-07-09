; Auto-generated. Do not edit!


(cl:in-package ps4_bot-msg)


;//! \htmlinclude vertices.msg.html

(cl:defclass <vertices> (roslisp-msg-protocol:ros-message)
  ((vertices
    :reader vertices
    :initarg :vertices
    :type (cl:vector geographic_msgs-msg:GeoPoint)
   :initform (cl:make-array 0 :element-type 'geographic_msgs-msg:GeoPoint :initial-element (cl:make-instance 'geographic_msgs-msg:GeoPoint))))
)

(cl:defclass vertices (<vertices>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <vertices>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'vertices)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ps4_bot-msg:<vertices> is deprecated: use ps4_bot-msg:vertices instead.")))

(cl:ensure-generic-function 'vertices-val :lambda-list '(m))
(cl:defmethod vertices-val ((m <vertices>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ps4_bot-msg:vertices-val is deprecated.  Use ps4_bot-msg:vertices instead.")
  (vertices m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <vertices>) ostream)
  "Serializes a message object of type '<vertices>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'vertices))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'vertices))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <vertices>) istream)
  "Deserializes a message object of type '<vertices>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'vertices) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'vertices)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geographic_msgs-msg:GeoPoint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<vertices>)))
  "Returns string type for a message object of type '<vertices>"
  "ps4_bot/vertices")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'vertices)))
  "Returns string type for a message object of type 'vertices"
  "ps4_bot/vertices")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<vertices>)))
  "Returns md5sum for a message object of type '<vertices>"
  "b1ad020a43453ed5acef914e15c95da8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'vertices)))
  "Returns md5sum for a message object of type 'vertices"
  "b1ad020a43453ed5acef914e15c95da8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<vertices>)))
  "Returns full string definition for message of type '<vertices>"
  (cl:format cl:nil "#list of GeoPoint~%geographic_msgs/GeoPoint[] vertices~%================================================================================~%MSG: geographic_msgs/GeoPoint~%# Geographic point, using the WGS 84 reference ellipsoid.~%~%# Latitude [degrees]. Positive is north of equator; negative is south~%# (-90 <= latitude <= +90).~%float64 latitude~%~%# Longitude [degrees]. Positive is east of prime meridian; negative is~%# west (-180 <= longitude <= +180). At the poles, latitude is -90 or~%# +90, and longitude is irrelevant, but must be in range.~%float64 longitude~%~%# Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).~%float64 altitude~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'vertices)))
  "Returns full string definition for message of type 'vertices"
  (cl:format cl:nil "#list of GeoPoint~%geographic_msgs/GeoPoint[] vertices~%================================================================================~%MSG: geographic_msgs/GeoPoint~%# Geographic point, using the WGS 84 reference ellipsoid.~%~%# Latitude [degrees]. Positive is north of equator; negative is south~%# (-90 <= latitude <= +90).~%float64 latitude~%~%# Longitude [degrees]. Positive is east of prime meridian; negative is~%# west (-180 <= longitude <= +180). At the poles, latitude is -90 or~%# +90, and longitude is irrelevant, but must be in range.~%float64 longitude~%~%# Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).~%float64 altitude~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <vertices>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'vertices) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <vertices>))
  "Converts a ROS message object to a list"
  (cl:list 'vertices
    (cl:cons ':vertices (vertices msg))
))
