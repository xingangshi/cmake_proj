cmake_minimum_required(VERSION 3.15)

project(cmake_proj)

include_directories(${PROTOBUF_INCLUDE_DIRS}
    ${CMAKE_CURRENT_BINARY_DIR}
)

include_directories(
    3rd_libs/include/glog
    3rd_libs/include
    3rd_libs/include/protobuf3.6.1
    3rd_libs/include/asio1.61.1/include
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

enable_testing()

add_subdirectory(src)
add_subdirectory(proto)
add_subdirectory(util)
add_subdirectory(test)

PROTOBUF_GENERATE_CPP(PROTO_SRCS PROTO_HDRS proto/pb_test.proto)

add_executable(main main.cpp ${PROTO_SRCS} ${PROTO_HDRS})

target_link_libraries(main util mod player glog ${PROTOBUF_LIBRARIES})

