;; Auto-generated. Do not edit!


(when (boundp 'lidar_scan::range)
  (if (not (find-package "LIDAR_SCAN"))
    (make-package "LIDAR_SCAN"))
  (shadow 'range (find-package "LIDAR_SCAN")))
(unless (find-package "LIDAR_SCAN::RANGE")
  (make-package "LIDAR_SCAN::RANGE"))

(in-package "ROS")
;;//! \htmlinclude range.msg.html


(defclass lidar_scan::range
  :super ros::object
  :slots (_angle _distance ))

(defmethod lidar_scan::range
  (:init
   (&key
    ((:angle __angle) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:distance __distance) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _angle __angle)
   (setq _distance __distance)
   self)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:serialization-length
   ()
   (+
    ;; float32[] _angle
    (* 4    (length _angle)) 4
    ;; float32[] _distance
    (* 4    (length _distance)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _angle
     (write-long (length _angle) s)
     (dotimes (i (length _angle))
       (sys::poke (elt _angle i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _distance
     (write-long (length _distance) s)
     (dotimes (i (length _distance))
       (sys::poke (elt _distance i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _angle
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _angle (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _angle i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _distance
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _distance (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _distance i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get lidar_scan::range :md5sum-) "8d53d4c2718eeda94877ddbdb7bb34c6")
(setf (get lidar_scan::range :datatype-) "lidar_scan/range")
(setf (get lidar_scan::range :definition-)
      "float32[] angle
float32[] distance
")



(provide :lidar_scan/range "8d53d4c2718eeda94877ddbdb7bb34c6")


