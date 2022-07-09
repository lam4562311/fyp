// Auto-generated. Do not edit!

// Updated: Wed Jun 29 21:33:48 2022

// (in-package geographic_msgs.msg)


// ignore_for_file: unused_import, overridden_fields
import 'dart:convert';
import 'package:buffer/buffer.dart';
import 'package:dartros/msg_utils.dart';
import 'package:uuid_msgs/msgs.dart';
import 'KeyValue.dart';

//-----------------------------------------------------------

class MapFeature extends RosMessage<MapFeature> {
  UniqueID id;

  List<UniqueID> components;

  List<KeyValue> props;

  static MapFeature $prototype = MapFeature();
  MapFeature({ 
    UniqueID id,
    List<UniqueID> components,
    List<KeyValue> props,
  }):
  this.id = id ?? UniqueID(),
  this.components = components ?? [],
  this.props = props ?? [];

  @override
  MapFeature call({ 
    UniqueID id,
    List<UniqueID> components,
    List<KeyValue> props,
  }) => MapFeature(
  id: id,
  components: components,
  props: props,
  );

  void serialize(ByteDataWriter writer) {
    // Serializes a message object of type MapFeature
    // Serialize message field [id]
    id.serialize(writer);
    // Serialize message field [components]
    // Serialize the length for message field [components]
    writer.writeUint32(components.length);
    components.forEach((val) {
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
  MapFeature deserialize(ByteDataReader reader) {
    //deserializes a message object of type MapFeature
    final data = MapFeature();
    // Deserialize message field [id]
    data.id = UniqueID.$prototype.deserialize(reader);
    // Deserialize message field [components]
    {
      // Deserialize array length for message field [components]
      final len = reader.readInt32();
      data.components = List.generate(len, (_) => UniqueID.$prototype.deserialize(reader));
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
    length += 16 * components.length;
    props.forEach((val) {
      length += val.getMessageSize();
    });
    return length + 24;
  }

  @override
  String get fullType {
    // Returns string type for a message object
    return 'geographic_msgs/MapFeature';
  }

  @override
  String get md5sum {
    //Returns md5sum for a message object
    return 'e2505ace5e8da8a15b610eaf62bdefae';
  }

  @override
  String get messageDefinition {
    // Returns full string definition for message
    return '''# Geographic map feature.
#
# A list of WayPoint IDs for features like streets, highways, hiking
# trails, the outlines of buildings and parking lots in sequential
# order.
#
# Feature lists may also contain other feature lists as members.

uuid_msgs/UniqueID   id         # Unique feature identifier
uuid_msgs/UniqueID[] components # Sequence of feature components
KeyValue[] props                # Key/value properties for this feature

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

