// Auto-generated. Do not edit!

// Updated: Wed Jun 29 21:33:46 2022

// (in-package uuid_msgs.msg)


// ignore_for_file: unused_import, overridden_fields
import 'dart:convert';
import 'package:buffer/buffer.dart';
import 'package:dartros/msg_utils.dart';

//-----------------------------------------------------------

class UniqueID extends RosMessage<UniqueID> {
  List<int> uuid;

  static UniqueID $prototype = UniqueID();
  UniqueID({ 
    List<int> uuid,
  }):
  this.uuid = uuid ?? List.generate(16, (_) => 0);

  @override
  UniqueID call({ 
    List<int> uuid,
  }) => UniqueID(
  uuid: uuid,
  );

  void serialize(ByteDataWriter writer) {
    // Serializes a message object of type UniqueID
    // Check that the constant length array field [uuid] has the right length
    if (uuid.length != 16) {
      throw Exception('Unable to serialize array field uuid - length must be 16');
    }
    // Serialize message field [uuid]
    writer.writeArray<int>(uuid, (val) => writer.writeUint8(val), specArrayLen: 16);
  }

  @override
  UniqueID deserialize(ByteDataReader reader) {
    //deserializes a message object of type UniqueID
    final data = UniqueID();
    // Deserialize message field [uuid]
    data.uuid = reader.readArray<int>(() => reader.readUint8(), arrayLen: 16);
    return data;
  }

  int getMessageSize() {
    return 16;
  }

  @override
  String get fullType {
    // Returns string type for a message object
    return 'uuid_msgs/UniqueID';
  }

  @override
  String get md5sum {
    //Returns md5sum for a message object
    return 'fec2a93b6f5367ee8112c9c0b41ff310';
  }

  @override
  String get messageDefinition {
    // Returns full string definition for message
    return '''# A universally unique identifier (UUID).
#
#  http://en.wikipedia.org/wiki/Universally_unique_identifier
#  http://tools.ietf.org/html/rfc4122.html

uint8[16] uuid

''';
  }

}

