cmake_minimum_required(VERSION 3.15)

project(5_test)

add_executable(pass pass.cpp)
add_executable(fail fail.cpp)


enable_testing()

add_test(NAME pass COMMAND pass)
add_test(NAME fail COMMAND fail)

set_property(TEST fail
    PROPERTY WILL_FAIL TRUE
)


set_property(TEST pass
    PROPERTY WILL_FAIL TRUE
)
