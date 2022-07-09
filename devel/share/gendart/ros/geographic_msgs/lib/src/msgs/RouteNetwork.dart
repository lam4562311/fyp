// Auto-generated. Do not edit!

// Updated: Wed Jun 29 21:33:48 2022

// (in-package geographic_msgs.msg)


// ignore_for_file: unused_import, overridden_fields
import 'dart:convert';
import 'package:buffer/buffer.dart';
import 'package:dartros/msg_utils.dart';
import 'package:std_msgs/msgs.dart';
import 'package:uuid_msgs/msgs.dart';
import 'BoundingBox.dart';
import 'WayPoint.dart';
import 'RouteSegment.dart';
import 'KeyValue.dart';

//-----------------------------------------------------------

class RouteNetwork extends RosMessage<RouteNetwork> {
  Header header;

  UniqueID id;

  BoundingBox bounds;

  List<WayPoint> points;

  List<RouteSegment> segments;

  List<KeyValue> props;

  static RouteNetwork $prototype = RouteNetwork();
  RouteNetwork({ 
    Header header,
    UniqueID id,
    BoundingBox bounds,
    List<WayPoint> points,
    List<RouteSegment> segments,
    List<KeyValue> props,
  }):
  this.header = header ?? Header(),
  this.id = id ?? UniqueID(),
  this.bounds = bounds ?? BoundingBox(),
  this.points = points ?? [],
  this.segments = segments ?? [],
  this.props = props ?? [];

  @override
  RouteNetwork call({ 
    Header header,
    UniqueID id,
    BoundingBox bounds,
    List<WayPoint> points,
    List<RouteSegment> segments,
    List<KeyValue> props,
  }) => RouteNetwork(
  header: header,
  id: id,
  bounds: bounds,
  points: points,
  segments: segments,
  props: props,
  );

  void serialize(ByteDataWriter writer) {
    // Serializes a message object of type RouteNetwork
    // Serialize message field [header]
    header.serialize(writer);
    // Serialize message field [id]
    id.serialize(writer);
    // Serialize message field [bounds]
    bounds.serialize(writer);
    // Serialize message field [points]
    // Serialize the length for message field [points]
    writer.writeUint32(points.length);
    points.forEach((val) {
      val.serialize(writer);
    });
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
  RouteNetwork deserialize(ByteDataReader reader) {
    //deserializes a message object of type RouteNetwork
    final data = RouteNetwork();
    // Deserialize message field [header]
    data.header = Header.$prototype.deserialize(reader);
    // Deserialize message field [id]
    data.id = UniqueID.$prototype.deserialize(reader);
    // Deserialize message field [bounds]
    data.bounds = BoundingBox.$prototype.deserialize(reader);
    // Deserialize message field [points]
    {
      // Deserialize array length for message field [points]
      final len = reader.readInt32();
      data.points = List.generate(len, (_) => WayPoint.$prototype.deserialize(reader));
    }
    // Deserialize message field [segments]
    {
      // Deserialize array length for message field [segments]
      final len = reader.readInt32();
      data.segments = List.generate(len, (_) => RouteSegment.$prototype.deserialize(reader));
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
    points.forEach((val) {
      length += val.getMessageSize();
    });
    segments.forEach((val) {
      length += val.getMessageSize();
    });
    props.forEach((val) {
      length += val.getMessageSize();
    });
    return length + 76;
  }

  @override
  String get fullType {
    // Returns string type for a message object
    return 'geographic_msgs/RouteNetwork';
  }

  @override
  String get md5sum {
    //Returns md5sum for a message object
    return 'fd717c0a34a7c954deed32c6847f30a8';
  }

  @override
  String get messageDefinition {
    // Returns full string definition for message
    return '''# Geographic map route network.
#
# A directed graph of WayPoint nodes and RouteSegment edges.  This
# information is extracted from the more-detailed contents of a
# GeographicMap.  A RouteNetwork contains only the way points and
# route segments of interest for path planning.

Header          header

uuid_msgs/UniqueID id    # This route network identifier
BoundingBox     bounds   # 2D bounding box for network

WayPoint[]      points   # Way points in this network
RouteSegment[]  segments # Directed edges of this network

KeyValue[]      props    # Network key/value properties

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
MSG: geographic_msgs/BoundingBox
# Geographic map bounding box. 
#
# The two GeoPoints denote diagonally opposite corners of the box.
#
# If min_pt.latitude is NaN, the bounding box is "global", matching
# any valid latitude, longitude and altitude.
#
# If min_pt.altitude is NaN, the bounding box is two-dimensional and
# matches any altitude within the specified latitude and longitude
# range.

GeoPoint min_pt         # lowest and most Southwestern corner
GeoPoint max_pt         # highest and most Northeastern corner

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
MSG: geographic_msgs/WayPoint
# Way-point element for a geographic map.

uuid_msgs/UniqueID id   # Unique way-point identifier
GeoPoint   position     # Position relative to WGS 84 ellipsoid
KeyValue[] props        # Key/value properties for this point

================================================================================
MSG: geographic_msgs/KeyValue
# Geographic map tag (key, value) pair
#
# This is equivalent to diagnostic_msgs/KeyValue, repeated here to
# avoid introducing a trivial stack dependency.

string key                     # tag label
string value                   # corresponding value

================================================================================
MSG: geographic_msgs/RouteSegment
# Route network segment.
#
# This is one directed edge of a RouteNetwork graph. It represents a
# known path from one way point to another.  If the path is two-way,
# there will be another RouteSegment with "start" and "end" reversed.

uuid_msgs/UniqueID id           # Unique identifier for this segment

uuid_msgs/UniqueID start        # beginning way point of segment
uuid_msgs/UniqueID end          # ending way point of segment

KeyValue[] props                # segment properties

''';
  }

}

