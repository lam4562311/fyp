// Auto-generated. Do not edit!

// Updated: Sun Jul 10 22:38:31 2022

// (in-package ps4_bot.srv)


// ignore_for_file: unused_import, overridden_fields
import 'dart:convert';
import 'package:buffer/buffer.dart';
import 'package:dartros/msg_utils.dart';
import 'package:geographic_msgs/msgs.dart';
import '../msgs/vertices.dart';

//-----------------------------------------------------------


//-----------------------------------------------------------

class navigationRequest extends RosMessage<navigationRequest> {
  GeoPoint start;

  GeoPoint goal;

  BoundingBox boundary;

  GeoPoint center;

  List<vertices> polygons;

  bool navigation_status;

  static navigationRequest $prototype = navigationRequest();
  navigationRequest({ 
    GeoPoint start,
    GeoPoint goal,
    BoundingBox boundary,
    GeoPoint center,
    List<vertices> polygons,
    bool navigation_status,
  }):
  this.start = start ?? GeoPoint(),
  this.goal = goal ?? GeoPoint(),
  this.boundary = boundary ?? BoundingBox(),
  this.center = center ?? GeoPoint(),
  this.polygons = polygons ?? [],
  this.navigation_status = navigation_status ?? false;

  @override
  navigationRequest call({ 
    GeoPoint start,
    GeoPoint goal,
    BoundingBox boundary,
    GeoPoint center,
    List<vertices> polygons,
    bool navigation_status,
  }) => navigationRequest(
  start: start,
  goal: goal,
  boundary: boundary,
  center: center,
  polygons: polygons,
  navigation_status: navigation_status,
  );

  void serialize(ByteDataWriter writer) {
    // Serializes a message object of type navigationRequest
    // Serialize message field [start]
    start.serialize(writer);
    // Serialize message field [goal]
    goal.serialize(writer);
    // Serialize message field [boundary]
    boundary.serialize(writer);
    // Serialize message field [center]
    center.serialize(writer);
    // Serialize message field [polygons]
    // Serialize the length for message field [polygons]
    writer.writeUint32(polygons.length);
    polygons.forEach((val) {
      val.serialize(writer);
    });
    // Serialize message field [navigation_status]
    writer.writeUint8(navigation_status == false ? 0 : 1);
  }

  @override
  navigationRequest deserialize(ByteDataReader reader) {
    //deserializes a message object of type navigationRequest
    final data = navigationRequest();
    // Deserialize message field [start]
    data.start = GeoPoint.$prototype.deserialize(reader);
    // Deserialize message field [goal]
    data.goal = GeoPoint.$prototype.deserialize(reader);
    // Deserialize message field [boundary]
    data.boundary = BoundingBox.$prototype.deserialize(reader);
    // Deserialize message field [center]
    data.center = GeoPoint.$prototype.deserialize(reader);
    // Deserialize message field [polygons]
    {
      // Deserialize array length for message field [polygons]
      final len = reader.readInt32();
      data.polygons = List.generate(len, (_) => vertices.$prototype.deserialize(reader));
    }
    // Deserialize message field [navigation_status]
    data.navigation_status = reader.readUint8() != 0;
    return data;
  }

  int getMessageSize() {
    var length = 0;
    polygons.forEach((val) {
      length += val.getMessageSize();
    });
    return length + 125;
  }

  @override
  String get fullType {
    // Returns string type for a service object
    return 'ps4_bot/navigationRequest';
  }

  @override
  String get md5sum {
    //Returns md5sum for a message object
    return '135fcffa3e2b8bd004214e3d13184e74';
  }

  @override
  String get messageDefinition {
    // Returns full string definition for message
    return '''#Recording the start and goal of the navigation

#lat lng of start position
geographic_msgs/GeoPoint start

#lat lng of goal position
geographic_msgs/GeoPoint goal

#boundary of control zone
#min SW
#max NE
geographic_msgs/BoundingBox boundary
geographic_msgs/GeoPoint center

#list of vertices
ps4_bot/vertices[] polygons

bool navigation_status


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
MSG: geographic_msgs/BoundingBox
# Geographic map bounding box. 
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
MSG: ps4_bot/vertices
#list of GeoPoint
geographic_msgs/GeoPoint[] vertices
''';
  }

}

class navigationResponse extends RosMessage<navigationResponse> {
  vertices polylines;

  static navigationResponse $prototype = navigationResponse();
  navigationResponse({ 
    vertices polylines,
  }):
  this.polylines = polylines ?? vertices();

  @override
  navigationResponse call({ 
    vertices polylines,
  }) => navigationResponse(
  polylines: polylines,
  );

  void serialize(ByteDataWriter writer) {
    // Serializes a message object of type navigationResponse
    // Serialize message field [polylines]
    polylines.serialize(writer);
  }

  @override
  navigationResponse deserialize(ByteDataReader reader) {
    //deserializes a message object of type navigationResponse
    final data = navigationResponse();
    // Deserialize message field [polylines]
    data.polylines = vertices.$prototype.deserialize(reader);
    return data;
  }

  int getMessageSize() {
    var length = 0;
    length += polylines.getMessageSize();
    return length;
  }

  @override
  String get fullType {
    // Returns string type for a service object
    return 'ps4_bot/navigationResponse';
  }

  @override
  String get md5sum {
    //Returns md5sum for a message object
    return 'e395a9670e57edfa54d085ef61bac472';
  }

  @override
  String get messageDefinition {
    // Returns full string definition for message
    return '''
ps4_bot/vertices polylines

================================================================================
MSG: ps4_bot/vertices
#list of GeoPoint
geographic_msgs/GeoPoint[] vertices
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

class navigation extends RosServiceMessage<navigationRequest, navigationResponse> {
  static final $prototype = navigation();
  @override
  navigationRequest get request => navigationRequest.$prototype;
  @override
  navigationResponse get response => navigationResponse.$prototype;
  @override
  String get md5sum => '2898f1f22432733d25df2f4d710eb4f7';
  @override
  String get fullType => 'ps4_bot/navigation';
}
