;; Auto-generated. Do not edit!


(when (boundp 'ps4_bot::Navigation)
  (if (not (find-package "PS4_BOT"))
    (make-package "PS4_BOT"))
  (shadow 'Navigation (find-package "PS4_BOT")))
(unless (find-package "PS4_BOT::NAVIGATION")
  (make-package "PS4_BOT::NAVIGATION"))

(in-package "ROS")
;;//! \htmlinclude Navigation.msg.html
(if (not (find-package "GEOGRAPHIC_MSGS"))
  (ros::roseus-add-msgs "geographic_msgs"))


(defclass ps4_bot::Navigation
  :super ros::object
  :slots (_center _half_of_size_x _half_of_size_y _width _height _matrix _path ))

(defmethod ps4_bot::Navigation
  (:init
   (&key
    ((:center __center) (instance geographic_msgs::GeoPoint :init))
    ((:half_of_size_x __half_of_size_x) 0)
    ((:half_of_size_y __half_of_size_y) 0)
    ((:width __width) 0)
    ((:height __height) 0)
    ((:matrix __matrix) (make-array 0 :initial-element 0 :element-type :char))
    ((:path __path) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _center __center)
   (setq _half_of_size_x (round __half_of_size_x))
   (setq _half_of_size_y (round __half_of_size_y))
   (setq _width (round __width))
   (setq _height (round __height))
   (setq _matrix __matrix)
   (setq _path __path)
   self)
  (:center
   (&rest __center)
   (if (keywordp (car __center))
       (send* _center __center)
     (progn
       (if __center (setq _center (car __center)))
       _center)))
  (:half_of_size_x
   (&optional __half_of_size_x)
   (if __half_of_size_x (setq _half_of_size_x __half_of_size_x)) _half_of_size_x)
  (:half_of_size_y
   (&optional __half_of_size_y)
   (if __half_of_size_y (setq _half_of_size_y __half_of_size_y)) _half_of_size_y)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:matrix
   (&optional __matrix)
   (if __matrix (setq _matrix __matrix)) _matrix)
  (:path
   (&optional __path)
   (if __path (setq _path __path)) _path)
  (:serialization-length
   ()
   (+
    ;; geographic_msgs/GeoPoint _center
    (send _center :serialization-length)
    ;; int64 _half_of_size_x
    8
    ;; int64 _half_of_size_y
    8
    ;; int64 _width
    8
    ;; int64 _height
    8
    ;; uint8[] _matrix
    (* 1    (length _matrix)) 4
    ;; int64[] _path
    (* 8    (length _path)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geographic_msgs/GeoPoint _center
       (send _center :serialize s)
     ;; int64 _half_of_size_x
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _half_of_size_x (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _half_of_size_x) (= (length (_half_of_size_x . bv)) 2)) ;; bignum
              (write-long (ash (elt (_half_of_size_x . bv) 0) 0) s)
              (write-long (ash (elt (_half_of_size_x . bv) 1) -1) s))
             ((and (class _half_of_size_x) (= (length (_half_of_size_x . bv)) 1)) ;; big1
              (write-long (elt (_half_of_size_x . bv) 0) s)
              (write-long (if (>= _half_of_size_x 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _half_of_size_x s)(write-long (if (>= _half_of_size_x 0) 0 #xffffffff) s)))
     ;; int64 _half_of_size_y
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _half_of_size_y (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _half_of_size_y) (= (length (_half_of_size_y . bv)) 2)) ;; bignum
              (write-long (ash (elt (_half_of_size_y . bv) 0) 0) s)
              (write-long (ash (elt (_half_of_size_y . bv) 1) -1) s))
             ((and (class _half_of_size_y) (= (length (_half_of_size_y . bv)) 1)) ;; big1
              (write-long (elt (_half_of_size_y . bv) 0) s)
              (write-long (if (>= _half_of_size_y 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _half_of_size_y s)(write-long (if (>= _half_of_size_y 0) 0 #xffffffff) s)))
     ;; int64 _width
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _width (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _width) (= (length (_width . bv)) 2)) ;; bignum
              (write-long (ash (elt (_width . bv) 0) 0) s)
              (write-long (ash (elt (_width . bv) 1) -1) s))
             ((and (class _width) (= (length (_width . bv)) 1)) ;; big1
              (write-long (elt (_width . bv) 0) s)
              (write-long (if (>= _width 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _width s)(write-long (if (>= _width 0) 0 #xffffffff) s)))
     ;; int64 _height
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _height (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _height) (= (length (_height . bv)) 2)) ;; bignum
              (write-long (ash (elt (_height . bv) 0) 0) s)
              (write-long (ash (elt (_height . bv) 1) -1) s))
             ((and (class _height) (= (length (_height . bv)) 1)) ;; big1
              (write-long (elt (_height . bv) 0) s)
              (write-long (if (>= _height 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _height s)(write-long (if (>= _height 0) 0 #xffffffff) s)))
     ;; uint8[] _matrix
     (write-long (length _matrix) s)
     (princ _matrix s)
     ;; int64[] _path
     (write-long (length _path) s)
     (dotimes (i (length _path))
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke (elt _path i) (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class (elt _path i)) (= (length ((elt _path i) . bv)) 2)) ;; bignum
              (write-long (ash (elt ((elt _path i) . bv) 0) 0) s)
              (write-long (ash (elt ((elt _path i) . bv) 1) -1) s))
             ((and (class (elt _path i)) (= (length ((elt _path i) . bv)) 1)) ;; big1
              (write-long (elt ((elt _path i) . bv) 0) s)
              (write-long (if (>= (elt _path i) 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long (elt _path i) s)(write-long (if (>= (elt _path i) 0) 0 #xffffffff) s)))
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geographic_msgs/GeoPoint _center
     (send _center :deserialize buf ptr-) (incf ptr- (send _center :serialization-length))
   ;; int64 _half_of_size_x
#+(or :alpha :irix6 :x86_64)
      (setf _half_of_size_x (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _half_of_size_x (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _half_of_size_y
#+(or :alpha :irix6 :x86_64)
      (setf _half_of_size_y (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _half_of_size_y (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _width
#+(or :alpha :irix6 :x86_64)
      (setf _width (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _width (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _height
#+(or :alpha :irix6 :x86_64)
      (setf _height (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _height (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; uint8[] _matrix
   (let ((n (sys::peek buf ptr- :integer))) (incf ptr- 4)
     (setq _matrix (make-array n :element-type :char))
     (replace _matrix buf :start2 ptr-) (incf ptr- n))
   ;; int64[] _path
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _path (instantiate integer-vector n))
     (dotimes (i n)
#+(or :alpha :irix6 :x86_64)
      (setf (elt _path i) (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf (elt _path i) (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
     ))
   ;;
   self)
  )

(setf (get ps4_bot::Navigation :md5sum-) "7307218b869e7c7e3251c645c123d534")
(setf (get ps4_bot::Navigation :datatype-) "ps4_bot/Navigation")
(setf (get ps4_bot::Navigation :definition-)
      "#self.center, self.half_of_size_x, self.half_of_size_y, self.matrix, self.path,
#Recording the start and goal of the navigation

#lat lng of center position
geographic_msgs/GeoPoint center

#map pixels
int64 half_of_size_x
int64 half_of_size_y

#map
int64 width
int64 height
uint8[] matrix

#path
int64[] path
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



(provide :ps4_bot/Navigation "7307218b869e7c7e3251c645c123d534")


