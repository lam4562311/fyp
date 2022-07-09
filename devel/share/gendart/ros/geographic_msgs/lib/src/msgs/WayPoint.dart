// Auto-generated. Do not edit!

// Updated: Wed Jun 29 21:33:48 2022

// (in-package geographic_msgs.msg)


// ignore_for_file: unused_import, overridden_fields
import 'dart:convert';
import 'package:buffer/buffer.dart';
import 'package:dartros/msg_utils.dart';
import 'package:uuid_msgs/msgs.dart';
import 'GeoPoint.dart';
import 'KeyValue.dart';

//-----------------------------------------------------------

class WayPoint extends RosMessage<WayPoint> {
  UniqueID id;

  GeoPoint position;

  List<KeyValue> props;

  static WayPoint $prototype = WayPoint();
  WayPoint({ 
    UniqueID id,
    GeoPoint position,
    List<KeyValue> props,
  }):
  this.id = id ?? UniqueID(),
  this.position = position ?? GeoPoint(),
  this.props = props ?? [];

  @override
  WayPoint call({ 
    UniqueID id,
    GeoPoint position,
    List<KeyValue> props,
  }) => WayPoint(
  id: id,
  position: position,
  props: props,
  );

  void serialize(ByteDataWriter writer) {
    // Serializes a message object of type WayPoint
    // Serialize message field [id]
    id.serialize(writer);
    // Serialize message field [position]
    position.serialize(writer);
    // Serialize message field [props]
    // Serialize the length for message field [props]
    writer.writeUint32(props.length);
    props.forEach((val) {
      val.serialize(writer);
    });
  }

  @override
  WayPoint deserialize(ByteDataReader reader) {
    //deserializes a message object of type WayPoint
    final data = WayPoint();
    // Deserialize message field [id]
    data.id = UniqueID.$prototype.deserialize(reader);
    // Deserialize message field [position]
    data.position = GeoPoint.$prototype.deserialize(reader);
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
    return length + 44;
  }

  @override
  String get fullType {
    // Returns string type for a message object
    return 'geographic_msgs/WayPoint';
  }

  @override
  String get md5sum {
    //Returns md5sum for a message object
    return 'ef04f823aef332455a49eaec3f1761b7';
  }

  @override
  String get messageDefinition {
    // Returns full string definition for message
    return '''# Way-point element for a geographic map.

uuid_msgs/UniqueID id   # Unique way-point identifier
GeoPoint   position     # Position relative to WGS 84 ellipsoid
KeyValue[] props        # Key/value properties for this point

================================================================================
MSG: uuid_msgs/UniqueID
# A universally unique identifier (UUID).
#
#  http://en.wikipedia.org/wiki/Universally_unique_identifier
#  http://tools.ietf.org/html/rfc4122.html

uint8[16] uuid

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

