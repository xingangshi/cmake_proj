#!/usr/bin/bash

rm -rf build

mkdir build && cd build && cmake .. && make pass && make fail

ctest .



