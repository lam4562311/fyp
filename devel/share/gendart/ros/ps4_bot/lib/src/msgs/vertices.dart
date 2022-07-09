// Auto-generated. Do not edit!

// Updated: Thu Jul  7 01:31:26 2022

// (in-package ps4_bot.msg)


// ignore_for_file: unused_import, overridden_fields
import 'dart:convert';
import 'package:buffer/buffer.dart';
import 'package:dartros/msg_utils.dart';
import 'package:geographic_msgs/msgs.dart';

//-----------------------------------------------------------

class vertices extends RosMessage<vertices> {
  List<GeoPoint> verticesValue;

  static vertices $prototype = vertices();
  vertices({ 
    List<GeoPoint> verticesValue,
  }):
  this.verticesValue = verticesValue ?? [];

  @override
  vertices call({ 
    List<GeoPoint> verticesValue,
  }) => vertices(
  verticesValue: verticesValue,
  );

  void serialize(ByteDataWriter writer) {
    // Serializes a message object of type vertices
    // Serialize message field [verticesValue]
    // Serialize the length for message field [verticesValue]
    writer.writeUint32(verticesValue.length);
    verticesValue.forEach((val) {
      val.serialize(writer);
    });
  }

  @override
  vertices deserialize(ByteDataReader reader) {
    //deserializes a message object of type vertices
    final data = vertices();
    // Deserialize message field [verticesValue]
    {
      // Deserialize array length for message field [verticesValue]
      final len = reader.readInt32();
      data.verticesValue = List.generate(len, (_) => GeoPoint.$prototype.deserialize(reader));
    }
    return data;
  }

  int getMessageSize() {
    var length = 0;
    length += 24 * verticesValue.length;
    return length + 4;
  }

  @override
  String get fullType {
    // Returns string type for a message object
    return 'ps4_bot/vertices';
  }

  @override
  String get md5sum {
    //Returns md5sum for a message object
    return 'b1ad020a43453ed5acef914e15c95da8';
  }

  @override
  String get messageDefinition {
    // Returns full string definition for message
    return '''#list of GeoPoint
geographic_msgs/GeoPoint[] vertices
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

''';
  }

}

