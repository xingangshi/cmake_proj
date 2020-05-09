cmake_minimum_required(VERSION 2.8...3.15)

project(cmake_proj)

# METHOD_1
#
## 查找 GTest 库
#find_package(GTest REQUIRED)
## GTest 的头文件
#include_directories(${GTEST_INCLUDE_DIRS})
#
#add_executable(test_tgtest test_tgtest.cpp)
#
## 链接测试库
#target_link_libraries(test_tgtest
#        ${GTEST_BOTH_LIBRARIES}
#        pthread)
#
## 添加到测试
#gtest_discover_tests(test_tgtest)

# METHOD_2
# 打印当前目录
message("Test this document: "  ${CMAKE_CURRENT_SOURCE_DIR})

# 需包含的头文件
INCLUDE_DIRECTORIES(
    ../3rd_libs/include/googletest/googletest/include
    #/usr/local/include
    #/usr/include
)

# 需包含的库文件
link_directories(
    ../3rd_libs/lib
    #/usr/local/lib
    #/usr/lib
)

find_package(Threads)

AUX_SOURCE_DIRECTORY(. DIR_SRC_TESTS)
add_executable(test_tgtest ${DIR_SRC_TESTS})


TARGET_LINK_LIBRARIES(test_tgtest
    gtest gtest_main player mod)


