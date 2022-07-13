# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ps4_bot: 2 messages, 2 services")

set(MSG_I_FLAGS "-Ips4_bot:/home/ubuntu/fyp/src/ps4_bot/msg;-Igeographic_msgs:/opt/ros/noetic/share/geographic_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Iuuid_msgs:/opt/ros/noetic/share/uuid_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(gendart REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ps4_bot_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ubuntu/fyp/src/ps4_bot/msg/Navigation.msg" NAME_WE)
add_custom_target(_ps4_bot_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ps4_bot" "/home/ubuntu/fyp/src/ps4_bot/msg/Navigation.msg" "geographic_msgs/BoundingBox:geographic_msgs/GeoPoint:ps4_bot/vertices"
)

get_filename_component(_filename "/home/ubuntu/fyp/src/ps4_bot/msg/vertices.msg" NAME_WE)
add_custom_target(_ps4_bot_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ps4_bot" "/home/ubuntu/fyp/src/ps4_bot/msg/vertices.msg" "geographic_msgs/GeoPoint"
)

get_filename_component(_filename "/home/ubuntu/fyp/src/ps4_bot/srv/navigation.srv" NAME_WE)
add_custom_target(_ps4_bot_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ps4_bot" "/home/ubuntu/fyp/src/ps4_bot/srv/navigation.srv" "geographic_msgs/BoundingBox:geographic_msgs/GeoPoint:ps4_bot/vertices"
)

get_filename_component(_filename "/home/ubuntu/fyp/src/ps4_bot/srv/AddtwoInts.srv" NAME_WE)
add_custom_target(_ps4_bot_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ps4_bot" "/home/ubuntu/fyp/src/ps4_bot/srv/AddtwoInts.srv" ""
)

#
#  langs = gencpp;gendart;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(ps4_bot
  "/home/ubuntu/fyp/src/ps4_bot/msg/Navigation.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/BoundingBox.msg;/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg;/home/ubuntu/fyp/src/ps4_bot/msg/vertices.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ps4_bot
)
_generate_msg_cpp(ps4_bot
  "/home/ubuntu/fyp/src/ps4_bot/msg/vertices.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ps4_bot
)

### Generating Services
_generate_srv_cpp(ps4_bot
  "/home/ubuntu/fyp/src/ps4_bot/srv/navigation.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/BoundingBox.msg;/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg;/home/ubuntu/fyp/src/ps4_bot/msg/vertices.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ps4_bot
)
_generate_srv_cpp(ps4_bot
  "/home/ubuntu/fyp/src/ps4_bot/srv/AddtwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ps4_bot
)

### Generating Module File
_generate_module_cpp(ps4_bot
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ps4_bot
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ps4_bot_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ps4_bot_generate_messages ps4_bot_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/fyp/src/ps4_bot/msg/Navigation.msg" NAME_WE)
add_dependencies(ps4_bot_generate_messages_cpp _ps4_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/fyp/src/ps4_bot/msg/vertices.msg" NAME_WE)
add_dependencies(ps4_bot_generate_messages_cpp _ps4_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/fyp/src/ps4_bot/srv/navigation.srv" NAME_WE)
add_dependencies(ps4_bot_generate_messages_cpp _ps4_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/fyp/src/ps4_bot/srv/AddtwoInts.srv" NAME_WE)
add_dependencies(ps4_bot_generate_messages_cpp _ps4_bot_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ps4_bot_gencpp)
add_dependencies(ps4_bot_gencpp ps4_bot_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ps4_bot_generate_messages_cpp)

### Section generating for lang: gendart
### Generating Messages
_generate_msg_dart(ps4_bot
  "/home/ubuntu/fyp/src/ps4_bot/msg/Navigation.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/BoundingBox.msg;/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg;/home/ubuntu/fyp/src/ps4_bot/msg/vertices.msg"
  ${CATKIN_DEVEL_PREFIX}/${gendart_INSTALL_DIR}/ps4_bot
)
_generate_msg_dart(ps4_bot
  "/home/ubuntu/fyp/src/ps4_bot/msg/vertices.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${gendart_INSTALL_DIR}/ps4_bot
)

### Generating Services
_generate_srv_dart(ps4_bot
  "/home/ubuntu/fyp/src/ps4_bot/srv/navigation.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/BoundingBox.msg;/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg;/home/ubuntu/fyp/src/ps4_bot/msg/vertices.msg"
  ${CATKIN_DEVEL_PREFIX}/${gendart_INSTALL_DIR}/ps4_bot
)
_generate_srv_dart(ps4_bot
  "/home/ubuntu/fyp/src/ps4_bot/srv/AddtwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gendart_INSTALL_DIR}/ps4_bot
)

### Generating Module File
_generate_module_dart(ps4_bot
  ${CATKIN_DEVEL_PREFIX}/${gendart_INSTALL_DIR}/ps4_bot
  "${ALL_GEN_OUTPUT_FILES_dart}"
)

add_custom_target(ps4_bot_generate_messages_dart
  DEPENDS ${ALL_GEN_OUTPUT_FILES_dart}
)
add_dependencies(ps4_bot_generate_messages ps4_bot_generate_messages_dart)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/fyp/src/ps4_bot/msg/Navigation.msg" NAME_WE)
add_dependencies(ps4_bot_generate_messages_dart _ps4_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/fyp/src/ps4_bot/msg/vertices.msg" NAME_WE)
add_dependencies(ps4_bot_generate_messages_dart _ps4_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/fyp/src/ps4_bot/srv/navigation.srv" NAME_WE)
add_dependencies(ps4_bot_generate_messages_dart _ps4_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/fyp/src/ps4_bot/srv/AddtwoInts.srv" NAME_WE)
add_dependencies(ps4_bot_generate_messages_dart _ps4_bot_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ps4_bot_gendart)
add_dependencies(ps4_bot_gendart ps4_bot_generate_messages_dart)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ps4_bot_generate_messages_dart)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(ps4_bot
  "/home/ubuntu/fyp/src/ps4_bot/msg/Navigation.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/BoundingBox.msg;/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg;/home/ubuntu/fyp/src/ps4_bot/msg/vertices.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ps4_bot
)
_generate_msg_eus(ps4_bot
  "/home/ubuntu/fyp/src/ps4_bot/msg/vertices.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ps4_bot
)

### Generating Services
_generate_srv_eus(ps4_bot
  "/home/ubuntu/fyp/src/ps4_bot/srv/navigation.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/BoundingBox.msg;/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg;/home/ubuntu/fyp/src/ps4_bot/msg/vertices.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ps4_bot
)
_generate_srv_eus(ps4_bot
  "/home/ubuntu/fyp/src/ps4_bot/srv/AddtwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ps4_bot
)

### Generating Module File
_generate_module_eus(ps4_bot
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ps4_bot
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(ps4_bot_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(ps4_bot_generate_messages ps4_bot_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/fyp/src/ps4_bot/msg/Navigation.msg" NAME_WE)
add_dependencies(ps4_bot_generate_messages_eus _ps4_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/fyp/src/ps4_bot/msg/vertices.msg" NAME_WE)
add_dependencies(ps4_bot_generate_messages_eus _ps4_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/fyp/src/ps4_bot/srv/navigation.srv" NAME_WE)
add_dependencies(ps4_bot_generate_messages_eus _ps4_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/fyp/src/ps4_bot/srv/AddtwoInts.srv" NAME_WE)
add_dependencies(ps4_bot_generate_messages_eus _ps4_bot_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ps4_bot_geneus)
add_dependencies(ps4_bot_geneus ps4_bot_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ps4_bot_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(ps4_bot
  "/home/ubuntu/fyp/src/ps4_bot/msg/Navigation.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/BoundingBox.msg;/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg;/home/ubuntu/fyp/src/ps4_bot/msg/vertices.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ps4_bot
)
_generate_msg_lisp(ps4_bot
  "/home/ubuntu/fyp/src/ps4_bot/msg/vertices.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ps4_bot
)

### Generating Services
_generate_srv_lisp(ps4_bot
  "/home/ubuntu/fyp/src/ps4_bot/srv/navigation.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/BoundingBox.msg;/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg;/home/ubuntu/fyp/src/ps4_bot/msg/vertices.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ps4_bot
)
_generate_srv_lisp(ps4_bot
  "/home/ubuntu/fyp/src/ps4_bot/srv/AddtwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ps4_bot
)

### Generating Module File
_generate_module_lisp(ps4_bot
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ps4_bot
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ps4_bot_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ps4_bot_generate_messages ps4_bot_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/fyp/src/ps4_bot/msg/Navigation.msg" NAME_WE)
add_dependencies(ps4_bot_generate_messages_lisp _ps4_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/fyp/src/ps4_bot/msg/vertices.msg" NAME_WE)
add_dependencies(ps4_bot_generate_messages_lisp _ps4_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/fyp/src/ps4_bot/srv/navigation.srv" NAME_WE)
add_dependencies(ps4_bot_generate_messages_lisp _ps4_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/fyp/src/ps4_bot/srv/AddtwoInts.srv" NAME_WE)
add_dependencies(ps4_bot_generate_messages_lisp _ps4_bot_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ps4_bot_genlisp)
add_dependencies(ps4_bot_genlisp ps4_bot_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ps4_bot_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(ps4_bot
  "/home/ubuntu/fyp/src/ps4_bot/msg/Navigation.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/BoundingBox.msg;/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg;/home/ubuntu/fyp/src/ps4_bot/msg/vertices.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ps4_bot
)
_generate_msg_nodejs(ps4_bot
  "/home/ubuntu/fyp/src/ps4_bot/msg/vertices.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ps4_bot
)

### Generating Services
_generate_srv_nodejs(ps4_bot
  "/home/ubuntu/fyp/src/ps4_bot/srv/navigation.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/BoundingBox.msg;/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg;/home/ubuntu/fyp/src/ps4_bot/msg/vertices.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ps4_bot
)
_generate_srv_nodejs(ps4_bot
  "/home/ubuntu/fyp/src/ps4_bot/srv/AddtwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ps4_bot
)

### Generating Module File
_generate_module_nodejs(ps4_bot
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ps4_bot
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(ps4_bot_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(ps4_bot_generate_messages ps4_bot_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/fyp/src/ps4_bot/msg/Navigation.msg" NAME_WE)
add_dependencies(ps4_bot_generate_messages_nodejs _ps4_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/fyp/src/ps4_bot/msg/vertices.msg" NAME_WE)
add_dependencies(ps4_bot_generate_messages_nodejs _ps4_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/fyp/src/ps4_bot/srv/navigation.srv" NAME_WE)
add_dependencies(ps4_bot_generate_messages_nodejs _ps4_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/fyp/src/ps4_bot/srv/AddtwoInts.srv" NAME_WE)
add_dependencies(ps4_bot_generate_messages_nodejs _ps4_bot_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ps4_bot_gennodejs)
add_dependencies(ps4_bot_gennodejs ps4_bot_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ps4_bot_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(ps4_bot
  "/home/ubuntu/fyp/src/ps4_bot/msg/Navigation.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/BoundingBox.msg;/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg;/home/ubuntu/fyp/src/ps4_bot/msg/vertices.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ps4_bot
)
_generate_msg_py(ps4_bot
  "/home/ubuntu/fyp/src/ps4_bot/msg/vertices.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ps4_bot
)

### Generating Services
_generate_srv_py(ps4_bot
  "/home/ubuntu/fyp/src/ps4_bot/srv/navigation.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/BoundingBox.msg;/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg;/home/ubuntu/fyp/src/ps4_bot/msg/vertices.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ps4_bot
)
_generate_srv_py(ps4_bot
  "/home/ubuntu/fyp/src/ps4_bot/srv/AddtwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ps4_bot
)

### Generating Module File
_generate_module_py(ps4_bot
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ps4_bot
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ps4_bot_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ps4_bot_generate_messages ps4_bot_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/fyp/src/ps4_bot/msg/Navigation.msg" NAME_WE)
add_dependencies(ps4_bot_generate_messages_py _ps4_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/fyp/src/ps4_bot/msg/vertices.msg" NAME_WE)
add_dependencies(ps4_bot_generate_messages_py _ps4_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/fyp/src/ps4_bot/srv/navigation.srv" NAME_WE)
add_dependencies(ps4_bot_generate_messages_py _ps4_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/fyp/src/ps4_bot/srv/AddtwoInts.srv" NAME_WE)
add_dependencies(ps4_bot_generate_messages_py _ps4_bot_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ps4_bot_genpy)
add_dependencies(ps4_bot_genpy ps4_bot_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ps4_bot_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ps4_bot)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ps4_bot
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geographic_msgs_generate_messages_cpp)
  add_dependencies(ps4_bot_generate_messages_cpp geographic_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(ps4_bot_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(ps4_bot_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(gendart_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gendart_INSTALL_DIR}/ps4_bot)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gendart_INSTALL_DIR}/ps4_bot
    DESTINATION ${gendart_INSTALL_DIR}
  )
endif()
if(TARGET geographic_msgs_generate_messages_dart)
  add_dependencies(ps4_bot_generate_messages_dart geographic_msgs_generate_messages_dart)
endif()
if(TARGET geometry_msgs_generate_messages_dart)
  add_dependencies(ps4_bot_generate_messages_dart geometry_msgs_generate_messages_dart)
endif()
if(TARGET std_msgs_generate_messages_dart)
  add_dependencies(ps4_bot_generate_messages_dart std_msgs_generate_messages_dart)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ps4_bot)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ps4_bot
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geographic_msgs_generate_messages_eus)
  add_dependencies(ps4_bot_generate_messages_eus geographic_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(ps4_bot_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(ps4_bot_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ps4_bot)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ps4_bot
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geographic_msgs_generate_messages_lisp)
  add_dependencies(ps4_bot_generate_messages_lisp geographic_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(ps4_bot_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(ps4_bot_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ps4_bot)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ps4_bot
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geographic_msgs_generate_messages_nodejs)
  add_dependencies(ps4_bot_generate_messages_nodejs geographic_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(ps4_bot_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(ps4_bot_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ps4_bot)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ps4_bot\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ps4_bot
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ps4_bot
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ps4_bot/.+/__init__.pyc?$"
  )
endif()
if(TARGET geographic_msgs_generate_messages_py)
  add_dependencies(ps4_bot_generate_messages_py geographic_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(ps4_bot_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(ps4_bot_generate_messages_py std_msgs_generate_messages_py)
endif()
