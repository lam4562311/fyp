// Auto-generated. Do not edit!

// Updated: Wed Jun 29 21:33:46 2022

// (in-package ps4-bot.msg)


// ignore_for_file: unused_import, overridden_fields
import 'dart:convert';
import 'package:buffer/buffer.dart';
import 'package:dartros/msg_utils.dart';
import 'package:geographic_msgs/msgs.dart';

//-----------------------------------------------------------

class Navigation extends RosMessage<Navigation> {
  GeoPoint start;

  GeoPoint goal;

  static Navigation $prototype = Navigation();
  Navigation({ 
    GeoPoint start,
    GeoPoint goal,
  }):
  this.start = start ?? GeoPoint(),
  this.goal = goal ?? GeoPoint();

  @override
  Navigation call({ 
    GeoPoint start,
    GeoPoint goal,
  }) => Navigation(
  start: start,
  goal: goal,
  );

  void serialize(ByteDataWriter writer) {
    // Serializes a message object of type Navigation
    // Serialize message field [start]
    start.serialize(writer);
    // Serialize message field [goal]
    goal.serialize(writer);
  }

  @override
  Navigation deserialize(ByteDataReader reader) {
    //deserializes a message object of type Navigation
    final data = Navigation();
    // Deserialize message field [start]
    data.start = GeoPoint.$prototype.deserialize(reader);
    // Deserialize message field [goal]
    data.goal = GeoPoint.$prototype.deserialize(reader);
    return data;
  }

  int getMessageSize() {
    return 48;
  }

  @override
  String get fullType {
    // Returns string type for a message object
    return 'ps4-bot/Navigation';
  }

  @override
  String get md5sum {
    //Returns md5sum for a message object
    return 'cad6de11e4ae4ca568785186e1f99f89';
  }

  @override
  String get messageDefinition {
    // Returns full string definition for message
    return '''#Recording the start and goal of the navigation

#lat lng of start position
geographic_msgs/GeoPoint start

#lat lng of goal position
geographic_msgs/GeoPoint goal

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

