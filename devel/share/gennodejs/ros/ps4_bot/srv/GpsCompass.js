// Auto-generated. Do not edit!

// (in-package ps4_bot.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

let geographic_msgs = _finder('geographic_msgs');

//-----------------------------------------------------------

class GpsCompassRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.request = null;
    }
    else {
      if (initObj.hasOwnProperty('request')) {
        this.request = initObj.request
      }
      else {
        this.request = new std_msgs.msg.Empty();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GpsCompassRequest
    // Serialize message field [request]
    bufferOffset = std_msgs.msg.Empty.serialize(obj.request, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GpsCompassRequest
    let len;
    let data = new GpsCompassRequest(null);
    // Deserialize message field [request]
    data.request = std_msgs.msg.Empty.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ps4_bot/GpsCompassRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '57c42d82c9bab8a1ec9de111b7540471';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #Empty msg for request
    std_msgs/Empty request
    
    ================================================================================
    MSG: std_msgs/Empty
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GpsCompassRequest(null);
    if (msg.request !== undefined) {
      resolved.request = std_msgs.msg.Empty.Resolve(msg.request)
    }
    else {
      resolved.request = new std_msgs.msg.Empty()
    }

    return resolved;
    }
};

class GpsCompassResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.position = null;
      this.angle = null;
    }
    else {
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = new geographic_msgs.msg.GeoPoint();
      }
      if (initObj.hasOwnProperty('angle')) {
        this.angle = initObj.angle
      }
      else {
        this.angle = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GpsCompassResponse
    // Serialize message field [position]
    bufferOffset = geographic_msgs.msg.GeoPoint.serialize(obj.position, buffer, bufferOffset);
    // Serialize message field [angle]
    bufferOffset = _serializer.float64(obj.angle, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GpsCompassResponse
    let len;
    let data = new GpsCompassResponse(null);
    // Deserialize message field [position]
    data.position = geographic_msgs.msg.GeoPoint.deserialize(buffer, bufferOffset);
    // Deserialize message field [angle]
    data.angle = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 32;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ps4_bot/GpsCompassResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6d2cef402af49fe31c4825156ee1a6e2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    #current position of client
    geographic_msgs/GeoPoint position
    
    #current orientation based on compass North(degree)
    float64 angle
    
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
    const resolved = new GpsCompassResponse(null);
    if (msg.position !== undefined) {
      resolved.position = geographic_msgs.msg.GeoPoint.Resolve(msg.position)
    }
    else {
      resolved.position = new geographic_msgs.msg.GeoPoint()
    }

    if (msg.angle !== undefined) {
      resolved.angle = msg.angle;
    }
    else {
      resolved.angle = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: GpsCompassRequest,
  Response: GpsCompassResponse,
  md5sum() { return 'b232e5ea178ff58767787805c24ec2f6'; },
  datatype() { return 'ps4_bot/GpsCompass'; }
};
