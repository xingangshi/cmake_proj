#!/usr/bin/bash


function del_old
{
  rm -rf build

  mkdir build

  mkdir build/log
}


function build_server
{
  cd build

  if [[ $1 == 1 ]];then
    echo "Build With Ninja"
    cmake -GNinja .. && ninja && cd ..
  else
    echo "Build With cmake"
    cmake .. && make && cd ..
  fi
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
  build_server $1
  start
}

start_all $1

