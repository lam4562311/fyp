// Auto-generated. Do not edit!

// Updated: Wed Jun 29 21:33:47 2022

// (in-package std_msgs.msg)


// ignore_for_file: unused_import, overridden_fields
import 'dart:convert';
import 'package:buffer/buffer.dart';
import 'package:dartros/msg_utils.dart';

//-----------------------------------------------------------

class UInt64 extends RosMessage<UInt64> {
  int data;

  static UInt64 $prototype = UInt64();
  UInt64({ 
    int data,
  }):
  this.data = data ?? 0;

  @override
  UInt64 call({ 
    int data,
  }) => UInt64(
  data: data,
  );

  void serialize(ByteDataWriter writer) {
    // Serializes a message object of type UInt64
    // Serialize message field [data]
    writer.writeUint64(data);
  }

  @override
  UInt64 deserialize(ByteDataReader reader) {
    //deserializes a message object of type UInt64
    final data = UInt64();
    // Deserialize message field [data]
    data.data = reader.readUint64();
    return data;
  }

  int getMessageSize() {
    return 8;
  }

  @override
  String get fullType {
    // Returns string type for a message object
    return 'std_msgs/UInt64';
  }

  @override
  String get md5sum {
    //Returns md5sum for a message object
    return '1b2a79973e8bf53d7b53acb71299cb57';
  }

  @override
  String get messageDefinition {
    // Returns full string definition for message
    return '''uint64 data
''';
  }

}

