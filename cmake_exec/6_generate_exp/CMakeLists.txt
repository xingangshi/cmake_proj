cmake_minimum_required(VERSION 2.8...3.15)

project(6_generate_exp)

# If no build type is specified, make it Release
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()

# Create a static library called mylib
add_library(hellolib STATIC
    hellolib.cpp
    hellolib.hpp
)

set_property(TARGET hellolib
    PROPERTY OUTPUT_NAME "hellolib$<CONFIG>"
)
