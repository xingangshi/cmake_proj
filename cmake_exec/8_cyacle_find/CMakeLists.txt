cmake_minimum_required(VERSION 2.8...3.15)

project(8_cycle_find)

# main
add_subdirectory(src)

# lib1 -> lib2 -> lib3 -> lib1
add_subdirectory(lib1)
add_subdirectory(lib2)
add_subdirectory(lib3)

# lib4 -> lib5
add_subdirectory(lib4)
add_subdirectory(lib5)

# lib6
add_subdirectory(lib6)

function(find_targets outname)
  set(dirlist "${CMAKE_CURRENT_LIST_DIR}")
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

function(detect_cycles_ target stack)
  get_property(is_visited TARGET ${target} PROPERTY CYCLE_VISITED)
  if(is_visited)
    return()
  endif()

  get_property(deps TARGET ${target} PROPERTY LINK_LIBRARIES)
  foreach(dep IN LISTS deps)
    if(dep IN_LIST stack)
      message("WARNING! Cycle detected: ${stack};${dep}")
    else()
      detect_cycles_(${dep} "${stack};${dep}")
    endif()
  endforeach()

  set_property(TARGET ${target} PROPERTY CYCLE_VISITED TRUE)
endfunction()

function(detect_cycles)
  find_targets(all_targets)
  message("All targets: ${all_targets}")

  foreach(target IN LISTS all_targets)
    detect_cycles_("${target}" "${target}")
  endforeach()
endfunction()

detect_cycles()
