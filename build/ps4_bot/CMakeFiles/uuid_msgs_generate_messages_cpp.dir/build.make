# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ubuntu/fyp/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/fyp/build

# Utility rule file for uuid_msgs_generate_messages_cpp.

# Include the progress variables for this target.
include ps4_bot/CMakeFiles/uuid_msgs_generate_messages_cpp.dir/progress.make

uuid_msgs_generate_messages_cpp: ps4_bot/CMakeFiles/uuid_msgs_generate_messages_cpp.dir/build.make

.PHONY : uuid_msgs_generate_messages_cpp

# Rule to build all files generated by this target.
ps4_bot/CMakeFiles/uuid_msgs_generate_messages_cpp.dir/build: uuid_msgs_generate_messages_cpp

.PHONY : ps4_bot/CMakeFiles/uuid_msgs_generate_messages_cpp.dir/build

ps4_bot/CMakeFiles/uuid_msgs_generate_messages_cpp.dir/clean:
	cd /home/ubuntu/fyp/build/ps4_bot && $(CMAKE_COMMAND) -P CMakeFiles/uuid_msgs_generate_messages_cpp.dir/cmake_clean.cmake
.PHONY : ps4_bot/CMakeFiles/uuid_msgs_generate_messages_cpp.dir/clean

ps4_bot/CMakeFiles/uuid_msgs_generate_messages_cpp.dir/depend:
	cd /home/ubuntu/fyp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/fyp/src /home/ubuntu/fyp/src/ps4_bot /home/ubuntu/fyp/build /home/ubuntu/fyp/build/ps4_bot /home/ubuntu/fyp/build/ps4_bot/CMakeFiles/uuid_msgs_generate_messages_cpp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : ps4_bot/CMakeFiles/uuid_msgs_generate_messages_cpp.dir/depend

