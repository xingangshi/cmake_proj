cmake_minimum_required(VERSION 3.15)

project(2_simple_lib)

add_subdirectory(lib)

add_executable(hello_world hello_world.cpp)

target_link_libraries(hello_world hellolib)
