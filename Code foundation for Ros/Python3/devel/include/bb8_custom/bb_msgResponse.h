// Generated by gencpp from file bb8_custom/bb_msgResponse.msg
// DO NOT EDIT!


#ifndef BB8_CUSTOM_MESSAGE_BB_MSGRESPONSE_H
#define BB8_CUSTOM_MESSAGE_BB_MSGRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace bb8_custom
{
template <class ContainerAllocator>
struct bb_msgResponse_
{
  typedef bb_msgResponse_<ContainerAllocator> Type;

  bb_msgResponse_()
    : success(false)  {
    }
  bb_msgResponse_(const ContainerAllocator& _alloc)
    : success(false)  {
  (void)_alloc;
    }



   typedef uint8_t _success_type;
  _success_type success;





  typedef boost::shared_ptr< ::bb8_custom::bb_msgResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::bb8_custom::bb_msgResponse_<ContainerAllocator> const> ConstPtr;

}; // struct bb_msgResponse_

typedef ::bb8_custom::bb_msgResponse_<std::allocator<void> > bb_msgResponse;

typedef boost::shared_ptr< ::bb8_custom::bb_msgResponse > bb_msgResponsePtr;
typedef boost::shared_ptr< ::bb8_custom::bb_msgResponse const> bb_msgResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::bb8_custom::bb_msgResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::bb8_custom::bb_msgResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace bb8_custom

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::bb8_custom::bb_msgResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::bb8_custom::bb_msgResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::bb8_custom::bb_msgResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::bb8_custom::bb_msgResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::bb8_custom::bb_msgResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::bb8_custom::bb_msgResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::bb8_custom::bb_msgResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "358e233cde0c8a8bcfea4ce193f8fc15";
  }

  static const char* value(const ::bb8_custom::bb_msgResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x358e233cde0c8a8bULL;
  static const uint64_t static_value2 = 0xcfea4ce193f8fc15ULL;
};

template<class ContainerAllocator>
struct DataType< ::bb8_custom::bb_msgResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bb8_custom/bb_msgResponse";
  }

  static const char* value(const ::bb8_custom::bb_msgResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::bb8_custom::bb_msgResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool success\n\
\n\
";
  }

  static const char* value(const ::bb8_custom::bb_msgResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::bb8_custom::bb_msgResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.success);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct bb_msgResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::bb8_custom::bb_msgResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::bb8_custom::bb_msgResponse_<ContainerAllocator>& v)
  {
    s << indent << "success: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.success);
  }
};

} // namespace message_operations
} // namespace ros

#endif // BB8_CUSTOM_MESSAGE_BB_MSGRESPONSE_H
