// Auto-generated. Do not edit!

// Updated: Mon Jul 18 02:24:01 2022

// (in-package ps4_bot.srv)


// ignore_for_file: unused_import, overridden_fields
import 'dart:convert';
import 'package:buffer/buffer.dart';
import 'package:dartros/msg_utils.dart';
import 'package:geographic_msgs/msgs.dart';

//-----------------------------------------------------------

import 'package:std_msgs/msgs.dart';

//-----------------------------------------------------------

class processing_navRequest extends RosMessage<processing_navRequest> {
  GeoPoint center;

  int half_of_size_x;

  int half_of_size_y;

  int width;

  int height;

  List<int> matrix;

  List<int> path;

  static processing_navRequest $prototype = processing_navRequest();
  processing_navRequest({ 
    GeoPoint center,
    int half_of_size_x,
    int half_of_size_y,
    int width,
    int height,
    List<int> matrix,
    List<int> path,
  }):
  this.center = center ?? GeoPoint(),
  this.half_of_size_x = half_of_size_x ?? 0,
  this.half_of_size_y = half_of_size_y ?? 0,
  this.width = width ?? 0,
  this.height = height ?? 0,
  this.matrix = matrix ?? [],
  this.path = path ?? [];

  @override
  processing_navRequest call({ 
    GeoPoint center,
    int half_of_size_x,
    int half_of_size_y,
    int width,
    int height,
    List<int> matrix,
    List<int> path,
  }) => processing_navRequest(
  center: center,
  half_of_size_x: half_of_size_x,
  half_of_size_y: half_of_size_y,
  width: width,
  height: height,
  matrix: matrix,
  path: path,
  );

  void serialize(ByteDataWriter writer) {
    // Serializes a message object of type processing_navRequest
    // Serialize message field [center]
    center.serialize(writer);
    // Serialize message field [half_of_size_x]
    writer.writeInt64(half_of_size_x);
    // Serialize message field [half_of_size_y]
    writer.writeInt64(half_of_size_y);
    // Serialize message field [width]
    writer.writeInt64(width);
    // Serialize message field [height]
    writer.writeInt64(height);
    // Serialize message field [matrix]
    writer.writeArray<int>(matrix, (val) => writer.writeUint8(val), specArrayLen: null);
    // Serialize message field [path]
    writer.writeArray<int>(path, (val) => writer.writeInt64(val), specArrayLen: null);
  }

  @override
  processing_navRequest deserialize(ByteDataReader reader) {
    //deserializes a message object of type processing_navRequest
    final data = processing_navRequest();
    // Deserialize message field [center]
    data.center = GeoPoint.$prototype.deserialize(reader);
    // Deserialize message field [half_of_size_x]
    data.half_of_size_x = reader.readInt64();
    // Deserialize message field [half_of_size_y]
    data.half_of_size_y = reader.readInt64();
    // Deserialize message field [width]
    data.width = reader.readInt64();
    // Deserialize message field [height]
    data.height = reader.readInt64();
    // Deserialize message field [matrix]
    data.matrix = reader.readArray<int>(() => reader.readUint8(), arrayLen: null);
    // Deserialize message field [path]
    data.path = reader.readArray<int>(() => reader.readInt64(), arrayLen: null);
    return data;
  }

  int getMessageSize() {
    var length = 0;
    length += matrix.length;
    length += 8 * path.length;
    return length + 64;
  }

  @override
  String get fullType {
    // Returns string type for a service object
    return 'ps4_bot/processing_navRequest';
  }

  @override
  String get md5sum {
    //Returns md5sum for a message object
    return '7307218b869e7c7e3251c645c123d534';
  }

  @override
  String get messageDefinition {
    // Returns full string definition for message
    return '''#self.center, self.half_of_size_x, self.half_of_size_y, self.matrix, self.path,
#Recording the start and goal of the navigation

#lat lng of center position
geographic_msgs/GeoPoint center

#map pixels
int64 half_of_size_x
int64 half_of_size_y

#map
int64 width
int64 height
uint8[] matrix

#path
int64[] path


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

class processing_navResponse extends RosMessage<processing_navResponse> {
  Empty response;

  static processing_navResponse $prototype = processing_navResponse();
  processing_navResponse({ 
    Empty response,
  }):
  this.response = response ?? Empty();

  @override
  processing_navResponse call({ 
    Empty response,
  }) => processing_navResponse(
  response: response,
  );

  void serialize(ByteDataWriter writer) {
    // Serializes a message object of type processing_navResponse
    // Serialize message field [response]
    response.serialize(writer);
  }

  @override
  processing_navResponse deserialize(ByteDataReader reader) {
    //deserializes a message object of type processing_navResponse
    final data = processing_navResponse();
    // Deserialize message field [response]
    data.response = Empty.$prototype.deserialize(reader);
    return data;
  }

  int getMessageSize() {
    return 0;
  }

  @override
  String get fullType {
    // Returns string type for a service object
    return 'ps4_bot/processing_navResponse';
  }

  @override
  String get md5sum {
    //Returns md5sum for a message object
    return 'f624545799d912fd57177cf7069e330d';
  }

  @override
  String get messageDefinition {
    // Returns full string definition for message
    return '''
std_msgs/Empty response

================================================================================
MSG: std_msgs/Empty

''';
  }

}

class processing_nav extends RosServiceMessage<processing_navRequest, processing_navResponse> {
  static final $prototype = processing_nav();
  @override
  processing_navRequest get request => processing_navRequest.$prototype;
  @override
  processing_navResponse get response => processing_navResponse.$prototype;
  @override
  String get md5sum => '6c2000b835c29a9b778713421830025f';
  @override
  String get fullType => 'ps4_bot/processing_nav';
}
