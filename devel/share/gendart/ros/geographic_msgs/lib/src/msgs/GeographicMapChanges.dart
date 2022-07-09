// Auto-generated. Do not edit!

// Updated: Wed Jun 29 21:33:48 2022

// (in-package geographic_msgs.msg)


// ignore_for_file: unused_import, overridden_fields
import 'dart:convert';
import 'package:buffer/buffer.dart';
import 'package:dartros/msg_utils.dart';
import 'package:std_msgs/msgs.dart';
import 'package:uuid_msgs/msgs.dart';
import 'GeographicMap.dart';

//-----------------------------------------------------------

class GeographicMapChanges extends RosMessage<GeographicMapChanges> {
  Header header;

  GeographicMap diffs;

  List<UniqueID> deletes;

  static GeographicMapChanges $prototype = GeographicMapChanges();
  GeographicMapChanges({ 
    Header header,
    GeographicMap diffs,
    List<UniqueID> deletes,
  }):
  this.header = header ?? Header(),
  this.diffs = diffs ?? GeographicMap(),
  this.deletes = deletes ?? [];

  @override
  GeographicMapChanges call({ 
    Header header,
    GeographicMap diffs,
    List<UniqueID> deletes,
  }) => GeographicMapChanges(
  header: header,
  diffs: diffs,
  deletes: deletes,
  );

  void serialize(ByteDataWriter writer) {
    // Serializes a message object of type GeographicMapChanges
    // Serialize message field [header]
    header.serialize(writer);
    // Serialize message field [diffs]
    diffs.serialize(writer);
    // Serialize message field [deletes]
    // Serialize the length for message field [deletes]
    writer.writeUint32(deletes.length);
    deletes.forEach((val) {
      val.serialize(writer);
    });
  }

  @override
  GeographicMapChanges deserialize(ByteDataReader reader) {
    //deserializes a message object of type GeographicMapChanges
    final data = GeographicMapChanges();
    // Deserialize message field [header]
    data.header = Header.$prototype.deserialize(reader);
    // Deserialize message field [diffs]
    data.diffs = GeographicMap.$prototype.deserialize(reader);
    // Deserialize message field [deletes]
    {
      // Deserialize array length for message field [deletes]
      final len = reader.readInt32();
      data.deletes = List.generate(len, (_) => UniqueID.$prototype.deserialize(reader));
    }
    return data;
  }

  int getMessageSize() {
    var length = 0;
    length += header.getMessageSize();
    length += diffs.getMessageSize();
    length += 16 * deletes.length;
    return length + 4;
  }

  @override
  String get fullType {
    // Returns string type for a message object
    return 'geographic_msgs/GeographicMapChanges';
  }

  @override
  String get md5sum {
    //Returns md5sum for a message object
    return '4fd027f54298203ec12aa1c4b20e6cb8';
  }

  @override
  String get messageDefinition {
    // Returns full string definition for message
    return '''# A list of geographic map changes.

Header header                   # stamp specifies time of change
                                # frame_id (normally /map)

GeographicMap diffs             # new and changed points and features
uuid_msgs/UniqueID[] deletes    # deleted map components

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
MSG: geographic_msgs/GeographicMap
# Geographic map for a specified region.

Header header            # stamp specifies time
                         # frame_id (normally /map)

uuid_msgs/UniqueID id    # identifier for this map
BoundingBox  bounds      # 2D bounding box containing map

WayPoint[]   points      # way-points
MapFeature[] features    # map features
KeyValue[]   props       # map properties

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
MSG: geographic_msgs/MapFeature
# Geographic map feature.
#
# A list of WayPoint IDs for features like streets, highways, hiking
# trails, the outlines of buildings and parking lots in sequential
# order.
#
# Feature lists may also contain other feature lists as members.

uuid_msgs/UniqueID   id         # Unique feature identifier
uuid_msgs/UniqueID[] components # Sequence of feature components
KeyValue[] props                # Key/value properties for this feature

''';
  }

}

