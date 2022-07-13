// Auto-generated. Do not edit!

// Updated: Sun Jul 10 22:38:31 2022

// (in-package ps4_bot.srv)


// ignore_for_file: unused_import, overridden_fields
import 'dart:convert';
import 'package:buffer/buffer.dart';
import 'package:dartros/msg_utils.dart';

//-----------------------------------------------------------


//-----------------------------------------------------------

class AddtwoIntsRequest extends RosMessage<AddtwoIntsRequest> {
  int a;

  int b;

  static AddtwoIntsRequest $prototype = AddtwoIntsRequest();
  AddtwoIntsRequest({ 
    int a,
    int b,
  }):
  this.a = a ?? 0,
  this.b = b ?? 0;

  @override
  AddtwoIntsRequest call({ 
    int a,
    int b,
  }) => AddtwoIntsRequest(
  a: a,
  b: b,
  );

  void serialize(ByteDataWriter writer) {
    // Serializes a message object of type AddtwoIntsRequest
    // Serialize message field [a]
    writer.writeInt64(a);
    // Serialize message field [b]
    writer.writeInt64(b);
  }

  @override
  AddtwoIntsRequest deserialize(ByteDataReader reader) {
    //deserializes a message object of type AddtwoIntsRequest
    final data = AddtwoIntsRequest();
    // Deserialize message field [a]
    data.a = reader.readInt64();
    // Deserialize message field [b]
    data.b = reader.readInt64();
    return data;
  }

  int getMessageSize() {
    return 16;
  }

  @override
  String get fullType {
    // Returns string type for a service object
    return 'ps4_bot/AddtwoIntsRequest';
  }

  @override
  String get md5sum {
    //Returns md5sum for a message object
    return '36d09b846be0b371c5f190354dd3153e';
  }

  @override
  String get messageDefinition {
    // Returns full string definition for message
    return '''int64 a
int64 b

''';
  }

}

class AddtwoIntsResponse extends RosMessage<AddtwoIntsResponse> {
  int sum;

  static AddtwoIntsResponse $prototype = AddtwoIntsResponse();
  AddtwoIntsResponse({ 
    int sum,
  }):
  this.sum = sum ?? 0;

  @override
  AddtwoIntsResponse call({ 
    int sum,
  }) => AddtwoIntsResponse(
  sum: sum,
  );

  void serialize(ByteDataWriter writer) {
    // Serializes a message object of type AddtwoIntsResponse
    // Serialize message field [sum]
    writer.writeInt64(sum);
  }

  @override
  AddtwoIntsResponse deserialize(ByteDataReader reader) {
    //deserializes a message object of type AddtwoIntsResponse
    final data = AddtwoIntsResponse();
    // Deserialize message field [sum]
    data.sum = reader.readInt64();
    return data;
  }

  int getMessageSize() {
    return 8;
  }

  @override
  String get fullType {
    // Returns string type for a service object
    return 'ps4_bot/AddtwoIntsResponse';
  }

  @override
  String get md5sum {
    //Returns md5sum for a message object
    return 'b88405221c77b1878a3cbbfff53428d7';
  }

  @override
  String get messageDefinition {
    // Returns full string definition for message
    return '''int64 sum

''';
  }

}

class AddtwoInts extends RosServiceMessage<AddtwoIntsRequest, AddtwoIntsResponse> {
  static final $prototype = AddtwoInts();
  @override
  AddtwoIntsRequest get request => AddtwoIntsRequest.$prototype;
  @override
  AddtwoIntsResponse get response => AddtwoIntsResponse.$prototype;
  @override
  String get md5sum => '6a2e34150c00229791cc89ff309fff21';
  @override
  String get fullType => 'ps4_bot/AddtwoInts';
}
