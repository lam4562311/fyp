// Auto-generated. Do not edit!

// Updated: Wed Jun 29 21:33:48 2022

// (in-package geographic_msgs.msg)


// ignore_for_file: unused_import, overridden_fields
import 'dart:convert';
import 'package:buffer/buffer.dart';
import 'package:dartros/msg_utils.dart';
import 'package:geometry_msgs/msgs.dart';
import 'GeoPoint.dart';

//-----------------------------------------------------------

class GeoPose extends RosMessage<GeoPose> {
  GeoPoint position;

  Quaternion orientation;

  static GeoPose $prototype = GeoPose();
  GeoPose({ 
    GeoPoint position,
    Quaternion orientation,
  }):
  this.position = position ?? GeoPoint(),
  this.orientation = orientation ?? Quaternion();

  @override
  GeoPose call({ 
    GeoPoint position,
    Quaternion orientation,
  }) => GeoPose(
  position: position,
  orientation: orientation,
  );

  void serialize(ByteDataWriter writer) {
    // Serializes a message object of type GeoPose
    // Serialize message field [position]
    position.serialize(writer);
    // Serialize message field [orientation]
    orientation.serialize(writer);
  }

  @override
  GeoPose deserialize(ByteDataReader reader) {
    //deserializes a message object of type GeoPose
    final data = GeoPose();
    // Deserialize message field [position]
    data.position = GeoPoint.$prototype.deserialize(reader);
    // Deserialize message field [orientation]
    data.orientation = Quaternion.$prototype.deserialize(reader);
    return data;
  }

  int getMessageSize() {
    return 56;
  }

  @override
  String get fullType {
    // Returns string type for a message object
    return 'geographic_msgs/GeoPose';
  }

  @override
  String get md5sum {
    //Returns md5sum for a message object
    return '778680b5172de58b7c057d973576c784';
  }

  @override
  String get messageDefinition {
    // Returns full string definition for message
    return '''# Geographic pose, using the WGS 84 reference ellipsoid.
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

