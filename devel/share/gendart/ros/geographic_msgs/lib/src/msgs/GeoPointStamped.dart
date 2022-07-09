// Auto-generated. Do not edit!

// Updated: Wed Jun 29 21:33:48 2022

// (in-package geographic_msgs.msg)


// ignore_for_file: unused_import, overridden_fields
import 'dart:convert';
import 'package:buffer/buffer.dart';
import 'package:dartros/msg_utils.dart';
import 'package:std_msgs/msgs.dart';
import 'GeoPoint.dart';

//-----------------------------------------------------------

class GeoPointStamped extends RosMessage<GeoPointStamped> {
  Header header;

  GeoPoint position;

  static GeoPointStamped $prototype = GeoPointStamped();
  GeoPointStamped({ 
    Header header,
    GeoPoint position,
  }):
  this.header = header ?? Header(),
  this.position = position ?? GeoPoint();

  @override
  GeoPointStamped call({ 
    Header header,
    GeoPoint position,
  }) => GeoPointStamped(
  header: header,
  position: position,
  );

  void serialize(ByteDataWriter writer) {
    // Serializes a message object of type GeoPointStamped
    // Serialize message field [header]
    header.serialize(writer);
    // Serialize message field [position]
    position.serialize(writer);
  }

  @override
  GeoPointStamped deserialize(ByteDataReader reader) {
    //deserializes a message object of type GeoPointStamped
    final data = GeoPointStamped();
    // Deserialize message field [header]
    data.header = Header.$prototype.deserialize(reader);
    // Deserialize message field [position]
    data.position = GeoPoint.$prototype.deserialize(reader);
    return data;
  }

  int getMessageSize() {
    var length = 0;
    length += header.getMessageSize();
    return length + 24;
  }

  @override
  String get fullType {
    // Returns string type for a message object
    return 'geographic_msgs/GeoPointStamped';
  }

  @override
  String get md5sum {
    //Returns md5sum for a message object
    return 'ea50d268b03080563c330351a21edc89';
  }

  @override
  String get messageDefinition {
    // Returns full string definition for message
    return '''Header header
geographic_msgs/GeoPoint position

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

''';
  }

}

