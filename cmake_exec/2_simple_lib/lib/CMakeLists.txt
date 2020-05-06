cmake_minimum_required(VERSION 3.15)

project(2_simple_lib)

SET(LIB_SRC src)

#add_subdirectory(${LIB_SRC})

add_library(hellolib STATIC
    hellolib.hpp
    ${LIB_SRC}/hellolib.cpp
)


target_include_directories(hellolib
    PRIVATE src
    PUBLIC .
)
