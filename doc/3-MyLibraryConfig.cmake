include(CMakeFindDependencyMacro)

find_package(Foo 1.0)

include("${CMAKE_CURRENT_LIST_DIR}/MyLibraryTargets.cmake")
