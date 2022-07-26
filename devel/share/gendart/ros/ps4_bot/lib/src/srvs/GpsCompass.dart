// Auto-generated. Do not edit!

// Updated: Thu Jul 14 21:21:44 2022

// (in-package ps4_bot.srv)


// ignore_for_file: unused_import, overridden_fields
import 'dart:convert';
import 'package:buffer/buffer.dart';
import 'package:dartros/msg_utils.dart';
import 'package:std_msgs/msgs.dart';

//-----------------------------------------------------------

import 'package:geographic_msgs/msgs.dart';

//-----------------------------------------------------------

class GpsCompassRequest extends RosMessage<GpsCompassRequest> {
  Empty request;

  static GpsCompassRequest $prototype = GpsCompassRequest();
  GpsCompassRequest({ 
    Empty request,
  }):
  this.request = request ?? Empty();

  @override
  GpsCompassRequest call({ 
    Empty request,
  }) => GpsCompassRequest(
  request: request,
  );

  void serialize(ByteDataWriter writer) {
    // Serializes a message object of type GpsCompassRequest
    // Serialize message field [request]
    request.serialize(writer);
  }

  @override
  GpsCompassRequest deserialize(ByteDataReader reader) {
    //deserializes a message object of type GpsCompassRequest
    final data = GpsCompassRequest();
    // Deserialize message field [request]
    data.request = Empty.$prototype.deserialize(reader);
    return data;
  }

  int getMessageSize() {
    return 0;
  }

  @override
  String get fullType {
    // Returns string type for a service object
    return 'ps4_bot/GpsCompassRequest';
  }

  @override
  String get md5sum {
    //Returns md5sum for a message object
    return '57c42d82c9bab8a1ec9de111b7540471';
  }

  @override
  String get messageDefinition {
    // Returns full string definition for message
    return '''#Empty msg for request
std_msgs/Empty request

================================================================================
MSG: std_msgs/Empty

''';
  }

}

class GpsCompassResponse extends RosMessage<GpsCompassResponse> {
  GeoPoint position;

  double angle;

  static GpsCompassResponse $prototype = GpsCompassResponse();
  GpsCompassResponse({ 
    GeoPoint position,
    double angle,
  }):
  this.position = position ?? GeoPoint(),
  this.angle = angle ?? 0.0;

  @override
  GpsCompassResponse call({ 
    GeoPoint position,
    double angle,
  }) => GpsCompassResponse(
  position: position,
  angle: angle,
  );

  void serialize(ByteDataWriter writer) {
    // Serializes a message object of type GpsCompassResponse
    // Serialize message field [position]
    position.serialize(writer);
    // Serialize message field [angle]
    writer.writeFloat64(angle);
  }

  @override
  GpsCompassResponse deserialize(ByteDataReader reader) {
    //deserializes a message object of type GpsCompassResponse
    final data = GpsCompassResponse();
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
    // Returns string type for a service object
    return 'ps4_bot/GpsCompassResponse';
  }

  @override
  String get md5sum {
    //Returns md5sum for a message object
    return '6d2cef402af49fe31c4825156ee1a6e2';
  }

  @override
  String get messageDefinition {
    // Returns full string definition for message
    return '''
#current position of client
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

class GpsCompass extends RosServiceMessage<GpsCompassRequest, GpsCompassResponse> {
  static final $prototype = GpsCompass();
  @override
  GpsCompassRequest get request => GpsCompassRequest.$prototype;
  @override
  GpsCompassResponse get response => GpsCompassResponse.$prototype;
  @override
  String get md5sum => 'b232e5ea178ff58767787805c24ec2f6';
  @override
  String get fullType => 'ps4_bot/GpsCompass';
}
