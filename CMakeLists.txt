cmake_minimum_required(VERSION 2.8...3.15)

project(cmake_proj)

#include_directories(${PROTOBUF_INCLUDE_DIRS}
#    ${CMAKE_CURRENT_BINARY_DIR}
#)

include_directories(
    ${CMAKE_CURRENT_BINARY_DIR}
)

include_directories(
    3rd_libs/hpp
    3rd_libs/include/protobuf/src
    3rd_libs/include/asio/asio/include
    #/usr/local/include
    #/usr/include
    build/proto

)

include_directories(util src proto)

link_directories(
    3rd_libs/lib
    #/usr/local/lib
    #/usr/lib
)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

find_package(Protobuf REQUIRED)

# add project code
add_subdirectory(src)
add_subdirectory(proto)
add_subdirectory(util)

# add unit test module
enable_testing()
add_subdirectory(test)


PROTOBUF_GENERATE_CPP(PROTO_SRCS PROTO_HDRS proto/pb_test.proto)

add_executable(main main.cpp ${PROTO_SRCS} ${PROTO_HDRS})

target_link_libraries(main util mod player glog ${PROTOBUF_LIBRARIES})

