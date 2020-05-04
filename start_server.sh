#!/usr/bin/bash


function del_old
{
  rm -rf build

  mkdir build

  mkdir build/log
}


function build_server
{
  cd build && cmake .. && make && cd ..
}

function start
{
  cd build
  ./main
  cd ..
}

function start_all
{
  del_old
  build_server
  start
}

start_all

