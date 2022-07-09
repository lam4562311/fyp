// Auto-generated. Do not edit!

// (in-package ps4_bot.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geographic_msgs = _finder('geographic_msgs');

//-----------------------------------------------------------

class vertices {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.vertices = null;
    }
    else {
      if (initObj.hasOwnProperty('vertices')) {
        this.vertices = initObj.vertices
      }
      else {
        this.vertices = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type vertices
    // Serialize message field [vertices]
    // Serialize the length for message field [vertices]
    bufferOffset = _serializer.uint32(obj.vertices.length, buffer, bufferOffset);
    obj.vertices.forEach((val) => {
      bufferOffset = geographic_msgs.msg.GeoPoint.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type vertices
    let len;
    let data = new vertices(null);
    // Deserialize message field [vertices]
    // Deserialize array length for message field [vertices]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.vertices = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.vertices[i] = geographic_msgs.msg.GeoPoint.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 24 * object.vertices.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ps4_bot/vertices';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b1ad020a43453ed5acef914e15c95da8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #list of GeoPoint
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new vertices(null);
    if (msg.vertices !== undefined) {
      resolved.vertices = new Array(msg.vertices.length);
      for (let i = 0; i < resolved.vertices.length; ++i) {
        resolved.vertices[i] = geographic_msgs.msg.GeoPoint.Resolve(msg.vertices[i]);
      }
    }
    else {
      resolved.vertices = []
    }

    return resolved;
    }
};

module.exports = vertices;
