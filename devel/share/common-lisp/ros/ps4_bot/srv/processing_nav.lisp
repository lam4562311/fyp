; Auto-generated. Do not edit!


(cl:in-package ps4_bot-srv)


;//! \htmlinclude processing_nav-request.msg.html

(cl:defclass <processing_nav-request> (roslisp-msg-protocol:ros-message)
  ((center
    :reader center
    :initarg :center
    :type geographic_msgs-msg:GeoPoint
    :initform (cl:make-instance 'geographic_msgs-msg:GeoPoint))
   (half_of_size_x
    :reader half_of_size_x
    :initarg :half_of_size_x
    :type cl:integer
    :initform 0)
   (half_of_size_y
    :reader half_of_size_y
    :initarg :half_of_size_y
    :type cl:integer
    :initform 0)
   (width
    :reader width
    :initarg :width
    :type cl:integer
    :initform 0)
   (height
    :reader height
    :initarg :height
    :type cl:integer
    :initform 0)
   (matrix
    :reader matrix
    :initarg :matrix
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (path
    :reader path
    :initarg :path
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass processing_nav-request (<processing_nav-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <processing_nav-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'processing_nav-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ps4_bot-srv:<processing_nav-request> is deprecated: use ps4_bot-srv:processing_nav-request instead.")))

(cl:ensure-generic-function 'center-val :lambda-list '(m))
(cl:defmethod center-val ((m <processing_nav-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ps4_bot-srv:center-val is deprecated.  Use ps4_bot-srv:center instead.")
  (center m))

(cl:ensure-generic-function 'half_of_size_x-val :lambda-list '(m))
(cl:defmethod half_of_size_x-val ((m <processing_nav-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ps4_bot-srv:half_of_size_x-val is deprecated.  Use ps4_bot-srv:half_of_size_x instead.")
  (half_of_size_x m))

(cl:ensure-generic-function 'half_of_size_y-val :lambda-list '(m))
(cl:defmethod half_of_size_y-val ((m <processing_nav-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ps4_bot-srv:half_of_size_y-val is deprecated.  Use ps4_bot-srv:half_of_size_y instead.")
  (half_of_size_y m))

(cl:ensure-generic-function 'width-val :lambda-list '(m))
(cl:defmethod width-val ((m <processing_nav-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ps4_bot-srv:width-val is deprecated.  Use ps4_bot-srv:width instead.")
  (width m))

(cl:ensure-generic-function 'height-val :lambda-list '(m))
(cl:defmethod height-val ((m <processing_nav-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ps4_bot-srv:height-val is deprecated.  Use ps4_bot-srv:height instead.")
  (height m))

(cl:ensure-generic-function 'matrix-val :lambda-list '(m))
(cl:defmethod matrix-val ((m <processing_nav-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ps4_bot-srv:matrix-val is deprecated.  Use ps4_bot-srv:matrix instead.")
  (matrix m))

(cl:ensure-generic-function 'path-val :lambda-list '(m))
(cl:defmethod path-val ((m <processing_nav-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ps4_bot-srv:path-val is deprecated.  Use ps4_bot-srv:path instead.")
  (path m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <processing_nav-request>) ostream)
  "Serializes a message object of type '<processing_nav-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'center) ostream)
  (cl:let* ((signed (cl:slot-value msg 'half_of_size_x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'half_of_size_y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'width)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'height)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'matrix))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'matrix))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'path))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    ))
   (cl:slot-value msg 'path))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <processing_nav-request>) istream)
  "Deserializes a message object of type '<processing_nav-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'center) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'half_of_size_x) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'half_of_size_y) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'width) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'height) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'matrix) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'matrix)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'path) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'path)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<processing_nav-request>)))
  "Returns string type for a service object of type '<processing_nav-request>"
  "ps4_bot/processing_navRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'processing_nav-request)))
  "Returns string type for a service object of type 'processing_nav-request"
  "ps4_bot/processing_navRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<processing_nav-request>)))
  "Returns md5sum for a message object of type '<processing_nav-request>"
  "6c2000b835c29a9b778713421830025f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'processing_nav-request)))
  "Returns md5sum for a message object of type 'processing_nav-request"
  "6c2000b835c29a9b778713421830025f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<processing_nav-request>)))
  "Returns full string definition for message of type '<processing_nav-request>"
  (cl:format cl:nil "#self.center, self.half_of_size_x, self.half_of_size_y, self.matrix, self.path,~%#Recording the start and goal of the navigation~%~%#lat lng of center position~%geographic_msgs/GeoPoint center~%~%#map pixels~%int64 half_of_size_x~%int64 half_of_size_y~%~%#map~%int64 width~%int64 height~%uint8[] matrix~%~%#path~%int64[] path~%~%~%================================================================================~%MSG: geographic_msgs/GeoPoint~%# Geographic point, using the WGS 84 reference ellipsoid.~%~%# Latitude [degrees]. Positive is north of equator; negative is south~%# (-90 <= latitude <= +90).~%float64 latitude~%~%# Longitude [degrees]. Positive is east of prime meridian; negative is~%# west (-180 <= longitude <= +180). At the poles, latitude is -90 or~%# +90, and longitude is irrelevant, but must be in range.~%float64 longitude~%~%# Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).~%float64 altitude~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'processing_nav-request)))
  "Returns full string definition for message of type 'processing_nav-request"
  (cl:format cl:nil "#self.center, self.half_of_size_x, self.half_of_size_y, self.matrix, self.path,~%#Recording the start and goal of the navigation~%~%#lat lng of center position~%geographic_msgs/GeoPoint center~%~%#map pixels~%int64 half_of_size_x~%int64 half_of_size_y~%~%#map~%int64 width~%int64 height~%uint8[] matrix~%~%#path~%int64[] path~%~%~%================================================================================~%MSG: geographic_msgs/GeoPoint~%# Geographic point, using the WGS 84 reference ellipsoid.~%~%# Latitude [degrees]. Positive is north of equator; negative is south~%# (-90 <= latitude <= +90).~%float64 latitude~%~%# Longitude [degrees]. Positive is east of prime meridian; negative is~%# west (-180 <= longitude <= +180). At the poles, latitude is -90 or~%# +90, and longitude is irrelevant, but must be in range.~%float64 longitude~%~%# Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).~%float64 altitude~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <processing_nav-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'center))
     8
     8
     8
     8
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'matrix) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'path) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <processing_nav-request>))
  "Converts a ROS message object to a list"
  (cl:list 'processing_nav-request
    (cl:cons ':center (center msg))
    (cl:cons ':half_of_size_x (half_of_size_x msg))
    (cl:cons ':half_of_size_y (half_of_size_y msg))
    (cl:cons ':width (width msg))
    (cl:cons ':height (height msg))
    (cl:cons ':matrix (matrix msg))
    (cl:cons ':path (path msg))
))
;//! \htmlinclude processing_nav-response.msg.html

(cl:defclass <processing_nav-response> (roslisp-msg-protocol:ros-message)
  ((response
    :reader response
    :initarg :response
    :type std_msgs-msg:Empty
    :initform (cl:make-instance 'std_msgs-msg:Empty)))
)

(cl:defclass processing_nav-response (<processing_nav-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <processing_nav-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'processing_nav-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ps4_bot-srv:<processing_nav-response> is deprecated: use ps4_bot-srv:processing_nav-response instead.")))

(cl:ensure-generic-function 'response-val :lambda-list '(m))
(cl:defmethod response-val ((m <processing_nav-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ps4_bot-srv:response-val is deprecated.  Use ps4_bot-srv:response instead.")
  (response m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <processing_nav-response>) ostream)
  "Serializes a message object of type '<processing_nav-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'response) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <processing_nav-response>) istream)
  "Deserializes a message object of type '<processing_nav-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'response) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<processing_nav-response>)))
  "Returns string type for a service object of type '<processing_nav-response>"
  "ps4_bot/processing_navResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'processing_nav-response)))
  "Returns string type for a service object of type 'processing_nav-response"
  "ps4_bot/processing_navResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<processing_nav-response>)))
  "Returns md5sum for a message object of type '<processing_nav-response>"
  "6c2000b835c29a9b778713421830025f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'processing_nav-response)))
  "Returns md5sum for a message object of type 'processing_nav-response"
  "6c2000b835c29a9b778713421830025f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<processing_nav-response>)))
  "Returns full string definition for message of type '<processing_nav-response>"
  (cl:format cl:nil "~%std_msgs/Empty response~%~%================================================================================~%MSG: std_msgs/Empty~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'processing_nav-response)))
  "Returns full string definition for message of type 'processing_nav-response"
  (cl:format cl:nil "~%std_msgs/Empty response~%~%================================================================================~%MSG: std_msgs/Empty~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <processing_nav-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'response))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <processing_nav-response>))
  "Converts a ROS message object to a list"
  (cl:list 'processing_nav-response
    (cl:cons ':response (response msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'processing_nav)))
  'processing_nav-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'processing_nav)))
  'processing_nav-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'processing_nav)))
  "Returns string type for a service object of type '<processing_nav>"
  "ps4_bot/processing_nav")