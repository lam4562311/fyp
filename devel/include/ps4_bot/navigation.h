// Generated by gencpp from file ps4_bot/navigation.msg
// DO NOT EDIT!


#ifndef PS4_BOT_MESSAGE_NAVIGATION_H
#define PS4_BOT_MESSAGE_NAVIGATION_H

#include <ros/service_traits.h>


#include <ps4_bot/navigationRequest.h>
#include <ps4_bot/navigationResponse.h>


namespace ps4_bot
{

struct navigation
{

typedef navigationRequest Request;
typedef navigationResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct navigation
} // namespace ps4_bot


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::ps4_bot::navigation > {
  static const char* value()
  {
    return "2898f1f22432733d25df2f4d710eb4f7";
  }

  static const char* value(const ::ps4_bot::navigation&) { return value(); }
};

template<>
struct DataType< ::ps4_bot::navigation > {
  static const char* value()
  {
    return "ps4_bot/navigation";
  }

  static const char* value(const ::ps4_bot::navigation&) { return value(); }
};


// service_traits::MD5Sum< ::ps4_bot::navigationRequest> should match
// service_traits::MD5Sum< ::ps4_bot::navigation >
template<>
struct MD5Sum< ::ps4_bot::navigationRequest>
{
  static const char* value()
  {
    return MD5Sum< ::ps4_bot::navigation >::value();
  }
  static const char* value(const ::ps4_bot::navigationRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::ps4_bot::navigationRequest> should match
// service_traits::DataType< ::ps4_bot::navigation >
template<>
struct DataType< ::ps4_bot::navigationRequest>
{
  static const char* value()
  {
    return DataType< ::ps4_bot::navigation >::value();
  }
  static const char* value(const ::ps4_bot::navigationRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::ps4_bot::navigationResponse> should match
// service_traits::MD5Sum< ::ps4_bot::navigation >
template<>
struct MD5Sum< ::ps4_bot::navigationResponse>
{
  static const char* value()
  {
    return MD5Sum< ::ps4_bot::navigation >::value();
  }
  static const char* value(const ::ps4_bot::navigationResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::ps4_bot::navigationResponse> should match
// service_traits::DataType< ::ps4_bot::navigation >
template<>
struct DataType< ::ps4_bot::navigationResponse>
{
  static const char* value()
  {
    return DataType< ::ps4_bot::navigation >::value();
  }
  static const char* value(const ::ps4_bot::navigationResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // PS4_BOT_MESSAGE_NAVIGATION_H
