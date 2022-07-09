// Auto-generated. Do not edit!

// Updated: Wed Jun 29 21:33:48 2022

// (in-package geographic_msgs.msg)


// ignore_for_file: unused_import, overridden_fields
import 'dart:convert';
import 'package:buffer/buffer.dart';
import 'package:dartros/msg_utils.dart';
import 'package:std_msgs/msgs.dart';
import 'package:uuid_msgs/msgs.dart';
import 'KeyValue.dart';

//-----------------------------------------------------------

class RoutePath extends RosMessage<RoutePath> {
  Header header;

  UniqueID network;

  List<UniqueID> segments;

  List<KeyValue> props;

  static RoutePath $prototype = RoutePath();
  RoutePath({ 
    Header header,
    UniqueID network,
    List<UniqueID> segments,
    List<KeyValue> props,
  }):
  this.header = header ?? Header(),
  this.network = network ?? UniqueID(),
  this.segments = segments ?? [],
  this.props = props ?? [];

  @override
  RoutePath call({ 
    Header header,
    UniqueID network,
    List<UniqueID> segments,
    List<KeyValue> props,
  }) => RoutePath(
  header: header,
  network: network,
  segments: segments,
  props: props,
  );

  void serialize(ByteDataWriter writer) {
    // Serializes a message object of type RoutePath
    // Serialize message field [header]
    header.serialize(writer);
    // Serialize message field [network]
    network.serialize(writer);
    // Serialize message field [segments]
    // Serialize the length for message field [segments]
    writer.writeUint32(segments.length);
    segments.forEach((val) {
      val.serialize(writer);
    });
    // Serialize message field [props]
    // Serialize the length for message field [props]
    writer.writeUint32(props.length);
    props.forEach((val) {
      val.serialize(writer);
    });
  }

  @override
  RoutePath deserialize(ByteDataReader reader) {
    //deserializes a message object of type RoutePath
    final data = RoutePath();
    // Deserialize message field [header]
    data.header = Header.$prototype.deserialize(reader);
    // Deserialize message field [network]
    data.network = UniqueID.$prototype.deserialize(reader);
    // Deserialize message field [segments]
    {
      // Deserialize array length for message field [segments]
      final len = reader.readInt32();
      data.segments = List.generate(len, (_) => UniqueID.$prototype.deserialize(reader));
    }
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
    length += header.getMessageSize();
    length += 16 * segments.length;
    props.forEach((val) {
      length += val.getMessageSize();
    });
    return length + 24;
  }

  @override
  String get fullType {
    // Returns string type for a message object
    return 'geographic_msgs/RoutePath';
  }

  @override
  String get md5sum {
    //Returns md5sum for a message object
    return '0aa2dd809a8091bdb4466dfefecbb8cf';
  }

  @override
  String get messageDefinition {
    // Returns full string definition for message
    return '''# Path through a route network.
#
# A path is a sequence of RouteSegment edges.  This information is
# extracted from a RouteNetwork graph.  A RoutePath lists the route
# segments needed to reach some chosen goal.

Header header

uuid_msgs/UniqueID   network    # Route network containing this path
uuid_msgs/UniqueID[] segments   # Sequence of RouteSegment IDs
KeyValue[]           props      # Key/value properties

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

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

