// Auto-generated. Do not edit!

// Updated: Wed Jun 29 21:33:48 2022

// (in-package geographic_msgs.msg)


// ignore_for_file: unused_import, overridden_fields
import 'dart:convert';
import 'package:buffer/buffer.dart';
import 'package:dartros/msg_utils.dart';
import 'GeoPoint.dart';

//-----------------------------------------------------------

class BoundingBox extends RosMessage<BoundingBox> {
  GeoPoint min_pt;

  GeoPoint max_pt;

  static BoundingBox $prototype = BoundingBox();
  BoundingBox({ 
    GeoPoint min_pt,
    GeoPoint max_pt,
  }):
  this.min_pt = min_pt ?? GeoPoint(),
  this.max_pt = max_pt ?? GeoPoint();

  @override
  BoundingBox call({ 
    GeoPoint min_pt,
    GeoPoint max_pt,
  }) => BoundingBox(
  min_pt: min_pt,
  max_pt: max_pt,
  );

  void serialize(ByteDataWriter writer) {
    // Serializes a message object of type BoundingBox
    // Serialize message field [min_pt]
    min_pt.serialize(writer);
    // Serialize message field [max_pt]
    max_pt.serialize(writer);
  }

  @override
  BoundingBox deserialize(ByteDataReader reader) {
    //deserializes a message object of type BoundingBox
    final data = BoundingBox();
    // Deserialize message field [min_pt]
    data.min_pt = GeoPoint.$prototype.deserialize(reader);
    // Deserialize message field [max_pt]
    data.max_pt = GeoPoint.$prototype.deserialize(reader);
    return data;
  }

  int getMessageSize() {
    return 48;
  }

  @override
  String get fullType {
    // Returns string type for a message object
    return 'geographic_msgs/BoundingBox';
  }

  @override
  String get md5sum {
    //Returns md5sum for a message object
    return 'f62e8b5e390a3ac7603250d46e8f8446';
  }

  @override
  String get messageDefinition {
    // Returns full string definition for message
    return '''# Geographic map bounding box. 
#
# The two GeoPoints denote diagonally opposite corners of the box.
#
# If min_pt.latitude is NaN, the bounding box is "global", matching
# any valid latitude, longitude and altitude.
#
# If min_pt.altitude is NaN, the bounding box is two-dimensional and
# matches any altitude within the specified latitude and longitude
# range.

GeoPoint min_pt         # lowest and most Southwestern corner
GeoPoint max_pt         # highest and most Northeastern corner

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

