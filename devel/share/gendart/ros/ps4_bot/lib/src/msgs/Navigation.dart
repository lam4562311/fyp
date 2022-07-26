// Auto-generated. Do not edit!

// Updated: Sun Jul 17 20:32:55 2022

// (in-package ps4_bot.msg)


// ignore_for_file: unused_import, overridden_fields
import 'dart:convert';
import 'package:buffer/buffer.dart';
import 'package:dartros/msg_utils.dart';
import 'package:geographic_msgs/msgs.dart';

//-----------------------------------------------------------

class Navigation extends RosMessage<Navigation> {
  GeoPoint center;

  int half_of_size_x;

  int half_of_size_y;

  int width;

  int height;

  List<int> matrix;

  List<int> path;

  static Navigation $prototype = Navigation();
  Navigation({ 
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
  Navigation call({ 
    GeoPoint center,
    int half_of_size_x,
    int half_of_size_y,
    int width,
    int height,
    List<int> matrix,
    List<int> path,
  }) => Navigation(
  center: center,
  half_of_size_x: half_of_size_x,
  half_of_size_y: half_of_size_y,
  width: width,
  height: height,
  matrix: matrix,
  path: path,
  );

  void serialize(ByteDataWriter writer) {
    // Serializes a message object of type Navigation
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
  Navigation deserialize(ByteDataReader reader) {
    //deserializes a message object of type Navigation
    final data = Navigation();
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
    // Returns string type for a message object
    return 'ps4_bot/Navigation';
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

