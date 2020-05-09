cmake_minimum_required(VERSION 2.8...3.15)

project(cmake_proj)

add_library(mod STATIC mod.cpp mod.hpp)

add_library(player STATIC player.cpp player.hpp)
