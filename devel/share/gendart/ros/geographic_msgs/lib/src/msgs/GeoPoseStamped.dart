// Auto-generated. Do not edit!

// Updated: Wed Jun 29 21:33:48 2022

// (in-package geographic_msgs.msg)


// ignore_for_file: unused_import, overridden_fields
import 'dart:convert';
import 'package:buffer/buffer.dart';
import 'package:dartros/msg_utils.dart';
import 'package:std_msgs/msgs.dart';
import 'GeoPose.dart';

//-----------------------------------------------------------

class GeoPoseStamped extends RosMessage<GeoPoseStamped> {
  Header header;

  GeoPose pose;

  static GeoPoseStamped $prototype = GeoPoseStamped();
  GeoPoseStamped({ 
    Header header,
    GeoPose pose,
  }):
  this.header = header ?? Header(),
  this.pose = pose ?? GeoPose();

  @override
  GeoPoseStamped call({ 
    Header header,
    GeoPose pose,
  }) => GeoPoseStamped(
  header: header,
  pose: pose,
  );

  void serialize(ByteDataWriter writer) {
    // Serializes a message object of type GeoPoseStamped
    // Serialize message field [header]
    header.serialize(writer);
    // Serialize message field [pose]
    pose.serialize(writer);
  }

  @override
  GeoPoseStamped deserialize(ByteDataReader reader) {
    //deserializes a message object of type GeoPoseStamped
    final data = GeoPoseStamped();
    // Deserialize message field [header]
    data.header = Header.$prototype.deserialize(reader);
    // Deserialize message field [pose]
    data.pose = GeoPose.$prototype.deserialize(reader);
    return data;
  }

  int getMessageSize() {
    var length = 0;
    length += header.getMessageSize();
    return length + 56;
  }

  @override
  String get fullType {
    // Returns string type for a message object
    return 'geographic_msgs/GeoPoseStamped';
  }

  @override
  String get md5sum {
    //Returns md5sum for a message object
    return 'cc409c8ed6064d8a846fa207bf3fba6b';
  }

  @override
  String get messageDefinition {
    // Returns full string definition for message
    return '''Header header
geographic_msgs/GeoPose pose

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geographic_msgs/GeoPose
# Geographic pose, using the WGS 84 reference ellipsoid.
#
# Orientation uses the East-North-Up (ENU) frame of reference.
# (But, what about singularities at the poles?)

GeoPoint position
geometry_msgs/Quaternion orientation

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
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

''';
  }

}

