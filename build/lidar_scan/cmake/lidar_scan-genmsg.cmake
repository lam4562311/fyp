# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(WARNING "Invoking generate_messages() without having added any message or service file before.
You should either add add_message_files() and/or add_service_files() calls or remove the invocation of generate_messages().")
message(STATUS "lidar_scan: 0 messages, 0 services")

set(MSG_I_FLAGS "-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gendart REQUIRED)

add_custom_target(lidar_scan_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



#
#  langs = gendart
#

### Section generating for lang: gendart
### Generating Messages

### Generating Services

### Generating Module File
_generate_module_dart(lidar_scan
  ${CATKIN_DEVEL_PREFIX}/${gendart_INSTALL_DIR}/lidar_scan
  "${ALL_GEN_OUTPUT_FILES_dart}"
)

add_custom_target(lidar_scan_generate_messages_dart
  DEPENDS ${ALL_GEN_OUTPUT_FILES_dart}
)
add_dependencies(lidar_scan_generate_messages lidar_scan_generate_messages_dart)

# add dependencies to all check dependencies targets

# target for backward compatibility
add_custom_target(lidar_scan_gendart)
add_dependencies(lidar_scan_gendart lidar_scan_generate_messages_dart)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lidar_scan_generate_messages_dart)



if(gendart_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gendart_INSTALL_DIR}/lidar_scan)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gendart_INSTALL_DIR}/lidar_scan
    DESTINATION ${gendart_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_dart)
  add_dependencies(lidar_scan_generate_messages_dart sensor_msgs_generate_messages_dart)
endif()
if(TARGET std_msgs_generate_messages_dart)
  add_dependencies(lidar_scan_generate_messages_dart std_msgs_generate_messages_dart)
endif()
