// Auto-generated. Do not edit!

// (in-package ps4_bot.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let vertices = require('./vertices.js');
let geographic_msgs = _finder('geographic_msgs');

//-----------------------------------------------------------

class Navigation {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.start = null;
      this.goal = null;
      this.boundary = null;
      this.center = null;
      this.polygons = null;
      this.navigation_status = null;
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
      if (initObj.hasOwnProperty('boundary')) {
        this.boundary = initObj.boundary
      }
      else {
        this.boundary = new geographic_msgs.msg.BoundingBox();
      }
      if (initObj.hasOwnProperty('center')) {
        this.center = initObj.center
      }
      else {
        this.center = new geographic_msgs.msg.GeoPoint();
      }
      if (initObj.hasOwnProperty('polygons')) {
        this.polygons = initObj.polygons
      }
      else {
        this.polygons = [];
      }
      if (initObj.hasOwnProperty('navigation_status')) {
        this.navigation_status = initObj.navigation_status
      }
      else {
        this.navigation_status = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Navigation
    // Serialize message field [start]
    bufferOffset = geographic_msgs.msg.GeoPoint.serialize(obj.start, buffer, bufferOffset);
    // Serialize message field [goal]
    bufferOffset = geographic_msgs.msg.GeoPoint.serialize(obj.goal, buffer, bufferOffset);
    // Serialize message field [boundary]
    bufferOffset = geographic_msgs.msg.BoundingBox.serialize(obj.boundary, buffer, bufferOffset);
    // Serialize message field [center]
    bufferOffset = geographic_msgs.msg.GeoPoint.serialize(obj.center, buffer, bufferOffset);
    // Serialize message field [polygons]
    // Serialize the length for message field [polygons]
    bufferOffset = _serializer.uint32(obj.polygons.length, buffer, bufferOffset);
    obj.polygons.forEach((val) => {
      bufferOffset = vertices.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [navigation_status]
    bufferOffset = _serializer.bool(obj.navigation_status, buffer, bufferOffset);
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
    // Deserialize message field [boundary]
    data.boundary = geographic_msgs.msg.BoundingBox.deserialize(buffer, bufferOffset);
    // Deserialize message field [center]
    data.center = geographic_msgs.msg.GeoPoint.deserialize(buffer, bufferOffset);
    // Deserialize message field [polygons]
    // Deserialize array length for message field [polygons]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.polygons = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.polygons[i] = vertices.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [navigation_status]
    data.navigation_status = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.polygons.forEach((val) => {
      length += vertices.getMessageSize(val);
    });
    return length + 125;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ps4_bot/Navigation';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '135fcffa3e2b8bd004214e3d13184e74';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #Recording the start and goal of the navigation
    
    #lat lng of start position
    geographic_msgs/GeoPoint start
    
    #lat lng of goal position
    geographic_msgs/GeoPoint goal
    
    #boundary of control zone
    #min SW
    #max NE
    geographic_msgs/BoundingBox boundary
    geographic_msgs/GeoPoint center
    
    #list of vertices
    ps4_bot/vertices[] polygons
    
    bool navigation_status
    
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
    MSG: ps4_bot/vertices
    #list of GeoPoint
    geographic_msgs/GeoPoint[] vertices
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

    if (msg.boundary !== undefined) {
      resolved.boundary = geographic_msgs.msg.BoundingBox.Resolve(msg.boundary)
    }
    else {
      resolved.boundary = new geographic_msgs.msg.BoundingBox()
    }

    if (msg.center !== undefined) {
      resolved.center = geographic_msgs.msg.GeoPoint.Resolve(msg.center)
    }
    else {
      resolved.center = new geographic_msgs.msg.GeoPoint()
    }

    if (msg.polygons !== undefined) {
      resolved.polygons = new Array(msg.polygons.length);
      for (let i = 0; i < resolved.polygons.length; ++i) {
        resolved.polygons[i] = vertices.Resolve(msg.polygons[i]);
      }
    }
    else {
      resolved.polygons = []
    }

    if (msg.navigation_status !== undefined) {
      resolved.navigation_status = msg.navigation_status;
    }
    else {
      resolved.navigation_status = false
    }

    return resolved;
    }
};

module.exports = Navigation;
