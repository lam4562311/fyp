// Auto-generated. Do not edit!

// Updated: Wed Jun 29 21:33:46 2022

// (in-package geographic_msgs.msg)


// ignore_for_file: unused_import, overridden_fields
import 'dart:convert';
import 'package:buffer/buffer.dart';
import 'package:dartros/msg_utils.dart';
import 'package:uuid_msgs/msgs.dart';
import 'KeyValue.dart';

//-----------------------------------------------------------

class RouteSegment extends RosMessage<RouteSegment> {
  UniqueID id;

  UniqueID start;

  UniqueID end;

  List<KeyValue> props;

  static RouteSegment $prototype = RouteSegment();
  RouteSegment({ 
    UniqueID id,
    UniqueID start,
    UniqueID end,
    List<KeyValue> props,
  }):
  this.id = id ?? UniqueID(),
  this.start = start ?? UniqueID(),
  this.end = end ?? UniqueID(),
  this.props = props ?? [];

  @override
  RouteSegment call({ 
    UniqueID id,
    UniqueID start,
    UniqueID end,
    List<KeyValue> props,
  }) => RouteSegment(
  id: id,
  start: start,
  end: end,
  props: props,
  );

  void serialize(ByteDataWriter writer) {
    // Serializes a message object of type RouteSegment
    // Serialize message field [id]
    id.serialize(writer);
    // Serialize message field [start]
    start.serialize(writer);
    // Serialize message field [end]
    end.serialize(writer);
    // Serialize message field [props]
    // Serialize the length for message field [props]
    writer.writeUint32(props.length);
    props.forEach((val) {
      val.serialize(writer);
    });
  }

  @override
  RouteSegment deserialize(ByteDataReader reader) {
    //deserializes a message object of type RouteSegment
    final data = RouteSegment();
    // Deserialize message field [id]
    data.id = UniqueID.$prototype.deserialize(reader);
    // Deserialize message field [start]
    data.start = UniqueID.$prototype.deserialize(reader);
    // Deserialize message field [end]
    data.end = UniqueID.$prototype.deserialize(reader);
    // Deserialize message field [props]
    {
      // Deserialize array length for message field [props]
      final len = reader.readInt32();
      data.props = List.generate(len, (_) => KeyValue.$prototype.deserialize(reader));
    }
    return data;
  }

  int getMessageSize() {
    var length = 0;
    props.forEach((val) {
      length += val.getMessageSize();
    });
    return length + 52;
  }

  @override
  String get fullType {
    // Returns string type for a message object
    return 'geographic_msgs/RouteSegment';
  }

  @override
  String get md5sum {
    //Returns md5sum for a message object
    return '8583d1e2ddf1891c3934a5d2ed9a799c';
  }

  @override
  String get messageDefinition {
    // Returns full string definition for message
    return '''# Route network segment.
#
# This is one directed edge of a RouteNetwork graph. It represents a
# known path from one way point to another.  If the path is two-way,
# there will be another RouteSegment with "start" and "end" reversed.

uuid_msgs/UniqueID id           # Unique identifier for this segment

uuid_msgs/UniqueID start        # beginning way point of segment
uuid_msgs/UniqueID end          # ending way point of segment

KeyValue[] props                # segment properties

================================================================================
MSG: uuid_msgs/UniqueID
# A universally unique identifier (UUID).
#
#  http://en.wikipedia.org/wiki/Universally_unique_identifier
#  http://tools.ietf.org/html/rfc4122.html

uint8[16] uuid

================================================================================
MSG: geographic_msgs/KeyValue
# Geographic map tag (key, value) pair
#
# This is equivalent to diagnostic_msgs/KeyValue, repeated here to
# avoid introducing a trivial stack dependency.

string key                     # tag label
string value                   # corresponding value

''';
  }

}

