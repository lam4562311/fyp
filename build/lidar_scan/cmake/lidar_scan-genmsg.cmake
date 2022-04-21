# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "lidar_scan: 1 messages, 0 services")

set(MSG_I_FLAGS "-Ilidar_scan:/home/ubuntu/fyp/src/lidar_scan/msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(gendart REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(lidar_scan_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ubuntu/fyp/src/lidar_scan/msg/range.msg" NAME_WE)
add_custom_target(_lidar_scan_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "lidar_scan" "/home/ubuntu/fyp/src/lidar_scan/msg/range.msg" ""
)

#
#  langs = gencpp;gendart;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(lidar_scan
  "/home/ubuntu/fyp/src/lidar_scan/msg/range.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lidar_scan
)

### Generating Services

### Generating Module File
_generate_module_cpp(lidar_scan
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lidar_scan
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(lidar_scan_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(lidar_scan_generate_messages lidar_scan_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/fyp/src/lidar_scan/msg/range.msg" NAME_WE)
add_dependencies(lidar_scan_generate_messages_cpp _lidar_scan_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lidar_scan_gencpp)
add_dependencies(lidar_scan_gencpp lidar_scan_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lidar_scan_generate_messages_cpp)

### Section generating for lang: gendart
### Generating Messages
_generate_msg_dart(lidar_scan
  "/home/ubuntu/fyp/src/lidar_scan/msg/range.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gendart_INSTALL_DIR}/lidar_scan
)

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
get_filename_component(_filename "/home/ubuntu/fyp/src/lidar_scan/msg/range.msg" NAME_WE)
add_dependencies(lidar_scan_generate_messages_dart _lidar_scan_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lidar_scan_gendart)
add_dependencies(lidar_scan_gendart lidar_scan_generate_messages_dart)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lidar_scan_generate_messages_dart)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(lidar_scan
  "/home/ubuntu/fyp/src/lidar_scan/msg/range.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lidar_scan
)

### Generating Services

### Generating Module File
_generate_module_eus(lidar_scan
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lidar_scan
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(lidar_scan_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(lidar_scan_generate_messages lidar_scan_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/fyp/src/lidar_scan/msg/range.msg" NAME_WE)
add_dependencies(lidar_scan_generate_messages_eus _lidar_scan_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lidar_scan_geneus)
add_dependencies(lidar_scan_geneus lidar_scan_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lidar_scan_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(lidar_scan
  "/home/ubuntu/fyp/src/lidar_scan/msg/range.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lidar_scan
)

### Generating Services

### Generating Module File
_generate_module_lisp(lidar_scan
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lidar_scan
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(lidar_scan_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(lidar_scan_generate_messages lidar_scan_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/fyp/src/lidar_scan/msg/range.msg" NAME_WE)
add_dependencies(lidar_scan_generate_messages_lisp _lidar_scan_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lidar_scan_genlisp)
add_dependencies(lidar_scan_genlisp lidar_scan_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lidar_scan_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(lidar_scan
  "/home/ubuntu/fyp/src/lidar_scan/msg/range.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lidar_scan
)

### Generating Services

### Generating Module File
_generate_module_nodejs(lidar_scan
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lidar_scan
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(lidar_scan_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(lidar_scan_generate_messages lidar_scan_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/fyp/src/lidar_scan/msg/range.msg" NAME_WE)
add_dependencies(lidar_scan_generate_messages_nodejs _lidar_scan_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lidar_scan_gennodejs)
add_dependencies(lidar_scan_gennodejs lidar_scan_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lidar_scan_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(lidar_scan
  "/home/ubuntu/fyp/src/lidar_scan/msg/range.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lidar_scan
)

### Generating Services

### Generating Module File
_generate_module_py(lidar_scan
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lidar_scan
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(lidar_scan_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(lidar_scan_generate_messages lidar_scan_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/fyp/src/lidar_scan/msg/range.msg" NAME_WE)
add_dependencies(lidar_scan_generate_messages_py _lidar_scan_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lidar_scan_genpy)
add_dependencies(lidar_scan_genpy lidar_scan_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lidar_scan_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lidar_scan)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lidar_scan
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(lidar_scan_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(lidar_scan_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

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

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lidar_scan)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lidar_scan
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(lidar_scan_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(lidar_scan_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lidar_scan)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lidar_scan
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(lidar_scan_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(lidar_scan_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lidar_scan)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lidar_scan
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(lidar_scan_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(lidar_scan_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lidar_scan)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lidar_scan\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lidar_scan
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(lidar_scan_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(lidar_scan_generate_messages_py std_msgs_generate_messages_py)
endif()
