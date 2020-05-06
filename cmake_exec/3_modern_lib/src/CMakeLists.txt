cmake_minimum_required(VERSION 3.15)

project(3_modern_lib)

add_executable(main
    main.cpp
)

target_link_libraries(main PRIVATE mylib)
