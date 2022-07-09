// Auto-generated. Do not edit!

// (in-package ps4-bot.msg)


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
      this.start = null;
      this.goal = null;
    }
    else {
      if (initObj.hasOwnProperty('start')) {
        this.start = initObj.start
      }
      else {
        this.start = new geographic_msgs.msg.GeoPoint();
      }
      if (initObj.hasOwnProperty('goal')) {
        this.goal = initObj.goal
      }
      else {
        this.goal = new geographic_msgs.msg.GeoPoint();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Navigation
    // Serialize message field [start]
    bufferOffset = geographic_msgs.msg.GeoPoint.serialize(obj.start, buffer, bufferOffset);
    // Serialize message field [goal]
    bufferOffset = geographic_msgs.msg.GeoPoint.serialize(obj.goal, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Navigation
    let len;
    let data = new Navigation(null);
    // Deserialize message field [start]
    data.start = geographic_msgs.msg.GeoPoint.deserialize(buffer, bufferOffset);
    // Deserialize message field [goal]
    data.goal = geographic_msgs.msg.GeoPoint.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ps4-bot/Navigation';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cad6de11e4ae4ca568785186e1f99f89';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #Recording the start and goal of the navigation
    
    #lat lng of start position
    geographic_msgs/GeoPoint start
    
    #lat lng of goal position
    geographic_msgs/GeoPoint goal
    
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
    if (msg.start !== undefined) {
      resolved.start = geographic_msgs.msg.GeoPoint.Resolve(msg.start)
    }
    else {
      resolved.start = new geographic_msgs.msg.GeoPoint()
    }

    if (msg.goal !== undefined) {
      resolved.goal = geographic_msgs.msg.GeoPoint.Resolve(msg.goal)
    }
    else {
      resolved.goal = new geographic_msgs.msg.GeoPoint()
    }

    return resolved;
    }
};

module.exports = Navigation;
