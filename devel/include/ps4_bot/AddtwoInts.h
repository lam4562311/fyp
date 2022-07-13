// Generated by gencpp from file ps4_bot/AddtwoInts.msg
// DO NOT EDIT!


#ifndef PS4_BOT_MESSAGE_ADDTWOINTS_H
#define PS4_BOT_MESSAGE_ADDTWOINTS_H

#include <ros/service_traits.h>


#include <ps4_bot/AddtwoIntsRequest.h>
#include <ps4_bot/AddtwoIntsResponse.h>


namespace ps4_bot
{

struct AddtwoInts
{

typedef AddtwoIntsRequest Request;
typedef AddtwoIntsResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct AddtwoInts
} // namespace ps4_bot


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::ps4_bot::AddtwoInts > {
  static const char* value()
  {
    return "6a2e34150c00229791cc89ff309fff21";
  }

  static const char* value(const ::ps4_bot::AddtwoInts&) { return value(); }
};

template<>
struct DataType< ::ps4_bot::AddtwoInts > {
  static const char* value()
  {
    return "ps4_bot/AddtwoInts";
  }

  static const char* value(const ::ps4_bot::AddtwoInts&) { return value(); }
};


// service_traits::MD5Sum< ::ps4_bot::AddtwoIntsRequest> should match
// service_traits::MD5Sum< ::ps4_bot::AddtwoInts >
template<>
struct MD5Sum< ::ps4_bot::AddtwoIntsRequest>
{
  static const char* value()
  {
    return MD5Sum< ::ps4_bot::AddtwoInts >::value();
  }
  static const char* value(const ::ps4_bot::AddtwoIntsRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::ps4_bot::AddtwoIntsRequest> should match
// service_traits::DataType< ::ps4_bot::AddtwoInts >
template<>
struct DataType< ::ps4_bot::AddtwoIntsRequest>
{
  static const char* value()
  {
    return DataType< ::ps4_bot::AddtwoInts >::value();
  }
  static const char* value(const ::ps4_bot::AddtwoIntsRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::ps4_bot::AddtwoIntsResponse> should match
// service_traits::MD5Sum< ::ps4_bot::AddtwoInts >
template<>
struct MD5Sum< ::ps4_bot::AddtwoIntsResponse>
{
  static const char* value()
  {
    return MD5Sum< ::ps4_bot::AddtwoInts >::value();
  }
  static const char* value(const ::ps4_bot::AddtwoIntsResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::ps4_bot::AddtwoIntsResponse> should match
// service_traits::DataType< ::ps4_bot::AddtwoInts >
template<>
struct DataType< ::ps4_bot::AddtwoIntsResponse>
{
  static const char* value()
  {
    return DataType< ::ps4_bot::AddtwoInts >::value();
  }
  static const char* value(const ::ps4_bot::AddtwoIntsResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // PS4_BOT_MESSAGE_ADDTWOINTS_H