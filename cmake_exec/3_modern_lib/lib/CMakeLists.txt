cmake_minimum_required(VERSION 3.15)

project(3_modern_lib)

add_library(mylib STATIC
    include/mylib/mylib.hpp
    src/mylib.cpp
    src/impl/mylib_impl.hpp
    src/impl/mylib_impl.cpp
)

target_include_directories(mylib
    PRIVATE src
    PUBLIC  include
)

target_compile_definitions(mylib
    PRIVATE FASTPATH
)
