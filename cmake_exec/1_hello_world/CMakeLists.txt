cmake_minimum_required(VERSION 2.8...3.15)

#set(CMAKE_C_COMPILER /usr/bin/gcc830 CACHE PATH "" FORCE)
#set(CMAKE_CXX_COMPILER /usr/bin/g++830 CACHE PATH "" FORCE)

message(STATUS "Operation system name is ${CMAKE_SYSTEM_NAME}")
message(STATUS "Operation system name is ${CMAKE_HOST_SYSTEM_NAME}")

if (APPLE)
  message(APPLE)
elseif (WIN32)
  message(WIN32)
else()
  message(UNIX)
endif()

project(1_hello_world)

add_executable(hello_world hello_world.cpp)
