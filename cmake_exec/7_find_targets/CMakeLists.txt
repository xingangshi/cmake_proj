cmake_minimum_required(VERSION 3.15)

project(7_find_targets)

add_subdirectory(src)
add_subdirectory(lib1)
add_subdirectory(lib2)
add_subdirectory(lib3)
add_subdirectory(lib4)
add_subdirectory(lib5)
add_subdirectory(lib6)

function(find_targets outname)
  set(dirlist "${CMAKE_CURRENT_LIST_DIR}")
  message(${dirlist})
  set(targets)

  while(dirlist)
    list(GET dirlist 0 current_dir)
    list(REMOVE_AT dirlist 0)

    get_property(current_dir_targets DIRECTORY "${current_dir}" PROPERTY BUILDSYSTEM_TARGETS)
    list(APPEND targets "${current_dir_targets}")

    get_property(current_subdirs DIRECTORY "${current_dir}" PROPERTY SUBDIRECTORIES)
    if(current_subdirs)
      list(APPEND dirlist "${current_subdirs}")
    endif()
  endwhile()

  set(${outname} "${targets}" PARENT_SCOPE)
endfunction()

find_targets(all_targets)

message("All targets: ${all_targets}")
