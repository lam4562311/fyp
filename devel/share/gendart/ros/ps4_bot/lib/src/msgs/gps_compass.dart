// Auto-generated. Do not edit!

// Updated: Thu Jul 14 21:21:41 2022

// (in-package ps4_bot.msg)


// ignore_for_file: unused_import, overridden_fields
import 'dart:convert';
import 'package:buffer/buffer.dart';
import 'package:dartros/msg_utils.dart';
import 'package:geographic_msgs/msgs.dart';

//-----------------------------------------------------------

class gps_compass extends RosMessage<gps_compass> {
  GeoPoint position;

  double angle;

  static gps_compass $prototype = gps_compass();
  gps_compass({ 
    GeoPoint position,
    double angle,
  }):
  this.position = position ?? GeoPoint(),
  this.angle = angle ?? 0.0;

  @override
  gps_compass call({ 
    GeoPoint position,
    double angle,
  }) => gps_compass(
  position: position,
  angle: angle,
  );

  void serialize(ByteDataWriter writer) {
    // Serializes a message object of type gps_compass
    // Serialize message field [position]
    position.serialize(writer);
    // Serialize message field [angle]
    writer.writeFloat64(angle);
  }

  @override
  gps_compass deserialize(ByteDataReader reader) {
    //deserializes a message object of type gps_compass
    final data = gps_compass();
    // Deserialize message field [position]
    data.position = GeoPoint.$prototype.deserialize(reader);
    // Deserialize message field [angle]
    data.angle = reader.readFloat64();
    return data;
  }

  int getMessageSize() {
    return 32;
  }

  @override
  String get fullType {
    // Returns string type for a message object
    return 'ps4_bot/gps_compass';
  }

  @override
  String get md5sum {
    //Returns md5sum for a message object
    return '6d2cef402af49fe31c4825156ee1a6e2';
  }

  @override
  String get messageDefinition {
    // Returns full string definition for message
    return '''#current position of client
geographic_msgs/GeoPoint position

#current orientation based on compass North(degree)
float64 angle
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

