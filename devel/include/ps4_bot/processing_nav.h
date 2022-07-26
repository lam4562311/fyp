// Generated by gencpp from file ps4_bot/processing_nav.msg
// DO NOT EDIT!


#ifndef PS4_BOT_MESSAGE_PROCESSING_NAV_H
#define PS4_BOT_MESSAGE_PROCESSING_NAV_H

#include <ros/service_traits.h>


#include <ps4_bot/processing_navRequest.h>
#include <ps4_bot/processing_navResponse.h>


namespace ps4_bot
{

struct processing_nav
{

typedef processing_navRequest Request;
typedef processing_navResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct processing_nav
} // namespace ps4_bot


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::ps4_bot::processing_nav > {
  static const char* value()
  {
    return "6c2000b835c29a9b778713421830025f";
  }

  static const char* value(const ::ps4_bot::processing_nav&) { return value(); }
};

template<>
struct DataType< ::ps4_bot::processing_nav > {
  static const char* value()
  {
    return "ps4_bot/processing_nav";
  }

  static const char* value(const ::ps4_bot::processing_nav&) { return value(); }
};


// service_traits::MD5Sum< ::ps4_bot::processing_navRequest> should match
// service_traits::MD5Sum< ::ps4_bot::processing_nav >
template<>
struct MD5Sum< ::ps4_bot::processing_navRequest>
{
  static const char* value()
  {
    return MD5Sum< ::ps4_bot::processing_nav >::value();
  }
  static const char* value(const ::ps4_bot::processing_navRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::ps4_bot::processing_navRequest> should match
// service_traits::DataType< ::ps4_bot::processing_nav >
template<>
struct DataType< ::ps4_bot::processing_navRequest>
{
  static const char* value()
  {
    return DataType< ::ps4_bot::processing_nav >::value();
  }
  static const char* value(const ::ps4_bot::processing_navRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::ps4_bot::processing_navResponse> should match
// service_traits::MD5Sum< ::ps4_bot::processing_nav >
template<>
struct MD5Sum< ::ps4_bot::processing_navResponse>
{
  static const char* value()
  {
    return MD5Sum< ::ps4_bot::processing_nav >::value();
  }
  static const char* value(const ::ps4_bot::processing_navResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::ps4_bot::processing_navResponse> should match
// service_traits::DataType< ::ps4_bot::processing_nav >
template<>
struct DataType< ::ps4_bot::processing_navResponse>
{
  static const char* value()
  {
    return DataType< ::ps4_bot::processing_nav >::value();
  }
  static const char* value(const ::ps4_bot::processing_navResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // PS4_BOT_MESSAGE_PROCESSING_NAV_H