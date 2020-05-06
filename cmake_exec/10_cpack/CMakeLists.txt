cmake_minimum_required(VERSION 3.2)

project(10_cpack)

#set(CMAKE_DEBUG_POSTFIX "-d")

set(CMAKE_BUILD_TYPE "Release")
#set(CMAKE_BUILD_TYPE "Debug")

message(STATUS "Build type : ${CMAKE_BUILD_TYPE}")

add_library(Foo STATIC Foo.cpp)

set_property(TARGET Foo
    PROPERTY OUTPUT_NAME "Foo$<CONFIG>"
)

include (InstallRequiredSystemLibraries)
set (CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/License.txt")
set (CPACK_PACKAGE_VERSION_MAJOR "${Foo_VERSION_MAJOR}")
set (CPACK_PACKAGE_VERSION_MINOR "${Foo_VERSION_MINOR}")
include (CPack)

