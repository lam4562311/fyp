// Auto-generated. Do not edit!

// Updated: Wed Jun 29 21:33:48 2022

// (in-package geographic_msgs.msg)


// ignore_for_file: unused_import, overridden_fields
import 'dart:convert';
import 'package:buffer/buffer.dart';
import 'package:dartros/msg_utils.dart';

//-----------------------------------------------------------

class GeoPoint extends RosMessage<GeoPoint> {
  double latitude;

  double longitude;

  double altitude;

  static GeoPoint $prototype = GeoPoint();
  GeoPoint({ 
    double latitude,
    double longitude,
    double altitude,
  }):
  this.latitude = latitude ?? 0.0,
  this.longitude = longitude ?? 0.0,
  this.altitude = altitude ?? 0.0;

  @override
  GeoPoint call({ 
    double latitude,
    double longitude,
    double altitude,
  }) => GeoPoint(
  latitude: latitude,
  longitude: longitude,
  altitude: altitude,
  );

  void serialize(ByteDataWriter writer) {
    // Serializes a message object of type GeoPoint
    // Serialize message field [latitude]
    writer.writeFloat64(latitude);
    // Serialize message field [longitude]
    writer.writeFloat64(longitude);
    // Serialize message field [altitude]
    writer.writeFloat64(altitude);
  }

  @override
  GeoPoint deserialize(ByteDataReader reader) {
    //deserializes a message object of type GeoPoint
    final data = GeoPoint();
    // Deserialize message field [latitude]
    data.latitude = reader.readFloat64();
    // Deserialize message field [longitude]
    data.longitude = reader.readFloat64();
    // Deserialize message field [altitude]
    data.altitude = reader.readFloat64();
    return data;
  }

  int getMessageSize() {
    return 24;
  }

  @override
  String get fullType {
    // Returns string type for a message object
    return 'geographic_msgs/GeoPoint';
  }

  @override
  String get md5sum {
    //Returns md5sum for a message object
    return 'c48027a852aeff972be80478ff38e81a';
  }

  @override
  String get messageDefinition {
    // Returns full string definition for message
    return '''# Geographic point, using the WGS 84 reference ellipsoid.

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

