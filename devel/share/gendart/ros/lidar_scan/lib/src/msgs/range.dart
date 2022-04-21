// Auto-generated. Do not edit!

// Updated: Wed Jul 27 17:15:19 2022

// (in-package lidar_scan.msg)


// ignore_for_file: unused_import, overridden_fields
import 'dart:convert';
import 'package:buffer/buffer.dart';
import 'package:dartros/msg_utils.dart';

//-----------------------------------------------------------

class range extends RosMessage<range> {
  List<double> angle;

  List<double> distance;

  static range $prototype = range();
  range({ 
    List<double> angle,
    List<double> distance,
  }):
  this.angle = angle ?? [],
  this.distance = distance ?? [];

  @override
  range call({ 
    List<double> angle,
    List<double> distance,
  }) => range(
  angle: angle,
  distance: distance,
  );

  void serialize(ByteDataWriter writer) {
    // Serializes a message object of type range
    // Serialize message field [angle]
    writer.writeArray<double>(angle, (val) => writer.writeFloat32(val), specArrayLen: null);
    // Serialize message field [distance]
    writer.writeArray<double>(distance, (val) => writer.writeFloat32(val), specArrayLen: null);
  }

  @override
  range deserialize(ByteDataReader reader) {
    //deserializes a message object of type range
    final data = range();
    // Deserialize message field [angle]
    data.angle = reader.readArray<double>(() => reader.readFloat32(), arrayLen: null);
    // Deserialize message field [distance]
    data.distance = reader.readArray<double>(() => reader.readFloat32(), arrayLen: null);
    return data;
  }

  int getMessageSize() {
    var length = 0;
    length += 4 * angle.length;
    length += 4 * distance.length;
    return length + 8;
  }

  @override
  String get fullType {
    // Returns string type for a message object
    return 'lidar_scan/range';
  }

  @override
  String get md5sum {
    //Returns md5sum for a message object
    return '8d53d4c2718eeda94877ddbdb7bb34c6';
  }

  @override
  String get messageDefinition {
    // Returns full string definition for message
    return '''float32[] angle
float32[] distance
''';
  }

}

