#!/usr/bin/bash

rm -rf build

mkdir build && cd build

cmake .. && cmake ..

# 构建不包含源码的包
cpack --config CPackConfig.cmake

# 构建包含源码的包
cpack --config CPackSourceConfig.cmake
