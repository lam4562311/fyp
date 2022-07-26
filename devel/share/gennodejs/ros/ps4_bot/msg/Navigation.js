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

class Navigation {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.center = null;
      this.half_of_size_x = null;
      this.half_of_size_y = null;
      this.width = null;
      this.height = null;
      this.matrix = null;
      this.path = null;
    }
    else {
      if (initObj.hasOwnProperty('center')) {
        this.center = initObj.center
      }
      else {
        this.center = new geographic_msgs.msg.GeoPoint();
      }
      if (initObj.hasOwnProperty('half_of_size_x')) {
        this.half_of_size_x = initObj.half_of_size_x
      }
      else {
        this.half_of_size_x = 0;
      }
      if (initObj.hasOwnProperty('half_of_size_y')) {
        this.half_of_size_y = initObj.half_of_size_y
      }
      else {
        this.half_of_size_y = 0;
      }
      if (initObj.hasOwnProperty('width')) {
        this.width = initObj.width
      }
      else {
        this.width = 0;
      }
      if (initObj.hasOwnProperty('height')) {
        this.height = initObj.height
      }
      else {
        this.height = 0;
      }
      if (initObj.hasOwnProperty('matrix')) {
        this.matrix = initObj.matrix
      }
      else {
        this.matrix = [];
      }
      if (initObj.hasOwnProperty('path')) {
        this.path = initObj.path
      }
      else {
        this.path = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Navigation
    // Serialize message field [center]
    bufferOffset = geographic_msgs.msg.GeoPoint.serialize(obj.center, buffer, bufferOffset);
    // Serialize message field [half_of_size_x]
    bufferOffset = _serializer.int64(obj.half_of_size_x, buffer, bufferOffset);
    // Serialize message field [half_of_size_y]
    bufferOffset = _serializer.int64(obj.half_of_size_y, buffer, bufferOffset);
    // Serialize message field [width]
    bufferOffset = _serializer.int64(obj.width, buffer, bufferOffset);
    // Serialize message field [height]
    bufferOffset = _serializer.int64(obj.height, buffer, bufferOffset);
    // Serialize message field [matrix]
    bufferOffset = _arraySerializer.uint8(obj.matrix, buffer, bufferOffset, null);
    // Serialize message field [path]
    bufferOffset = _arraySerializer.int64(obj.path, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Navigation
    let len;
    let data = new Navigation(null);
    // Deserialize message field [center]
    data.center = geographic_msgs.msg.GeoPoint.deserialize(buffer, bufferOffset);
    // Deserialize message field [half_of_size_x]
    data.half_of_size_x = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [half_of_size_y]
    data.half_of_size_y = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [width]
    data.width = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [height]
    data.height = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [matrix]
    data.matrix = _arrayDeserializer.uint8(buffer, bufferOffset, null)
    // Deserialize message field [path]
    data.path = _arrayDeserializer.int64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.matrix.length;
    length += 8 * object.path.length;
    return length + 64;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ps4_bot/Navigation';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7307218b869e7c7e3251c645c123d534';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #self.center, self.half_of_size_x, self.half_of_size_y, self.matrix, self.path,
    #Recording the start and goal of the navigation
    
    #lat lng of center position
    geographic_msgs/GeoPoint center
    
    #map pixels
    int64 half_of_size_x
    int64 half_of_size_y
    
    #map
    int64 width
    int64 height
    uint8[] matrix
    
    #path
    int64[] path
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
    const resolved = new Navigation(null);
    if (msg.center !== undefined) {
      resolved.center = geographic_msgs.msg.GeoPoint.Resolve(msg.center)
    }
    else {
      resolved.center = new geographic_msgs.msg.GeoPoint()
    }

    if (msg.half_of_size_x !== undefined) {
      resolved.half_of_size_x = msg.half_of_size_x;
    }
    else {
      resolved.half_of_size_x = 0
    }

    if (msg.half_of_size_y !== undefined) {
      resolved.half_of_size_y = msg.half_of_size_y;
    }
    else {
      resolved.half_of_size_y = 0
    }

    if (msg.width !== undefined) {
      resolved.width = msg.width;
    }
    else {
      resolved.width = 0
    }

    if (msg.height !== undefined) {
      resolved.height = msg.height;
    }
    else {
      resolved.height = 0
    }

    if (msg.matrix !== undefined) {
      resolved.matrix = msg.matrix;
    }
    else {
      resolved.matrix = []
    }

    if (msg.path !== undefined) {
      resolved.path = msg.path;
    }
    else {
      resolved.path = []
    }

    return resolved;
    }
};

module.exports = Navigation;
