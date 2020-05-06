### cmake_proj

----

#### [Cmake](https://cmake.org/cmake/help/latest/manual/cmake-packages.7.html) 基础
##### 1. commands
> `cmmmand_name(space seperated list of strings)`

##### 2. Variable
> `set(<variable> <value>... [PARENT_SCOPE])`
>>
>> `set(hello world)`
>
> `message([<mode>] "message text" ...)`
>>
>> `message(STATUS "hello, ${hello})`
>
> `cmake_minimum_required(VERSION x.y)`
>
> `project(<name>)`
>
> `option(SECRET_FEATURE “Enable secretfeature” OFF)`

##### 3. 流程控制
> `if() / elseif() / else() / endif()`
>
> `foreach() / endforeach()`
>
> `while() / endwhile()`
>
> `break() / continue() / return()`

##### 4. 目标文件生成相关
> `include(<file>)`
>
> `add_subdirectory(<dir>)`
>
> `add_executable(<name> [WIN32] [MACOSX_BUNDLE][source1] [source2 ...])`
>
> `file([WRITE|READ] <file> <content>)`
>
> `add_library(<name> [STATIC | SHARED | INTERFACE] [source1] [source2 ...])`
>
> `add_custom_target(<name> [COMMAND command] [args] [DEPENDS depends] [WORKING_DIRECTORY dir])`
>
> `target_include_directories(<target> [PUBLIC | INTERFACE | PRIVATE ] <dir>)`
>
> `target_compile_definitions(<target> [PUBLIC | INTERFACE | PRIVATE ] <name>=<value>)`
>
> `target_compile_options(<target> [PUBLIC | INTERFACE | PRIVATE ] <option>)`
>
> `target_link_libraries(<target> [PUBLIC | PRIVATE | INTERFACE] <lib>)`

##### 5. 其他
> `include_directories()`
>
> `add_definitions()`
>
> `add_dependencies()`
>
> `add_compile_options()`
>
> `find_package()`
>
> `enable_testing()`
>
> `add_test()`
>
> `Comments start with #`


#### Cmake 备注

##### 引入目录
> 1. 外部或者第三方的目录 `add_subdirectory()`
>
> 2. 第三方的库使用 `git submodules` 添加的，使用 `add_subdirectory()`
>
> 3. `ExternalProject_Add()`，使用 `add_subdirectory()`
>
> 4. 下载和安装的第三方库，使用 `find_package()`

#####  Cmake 的各种目标类型
> 1. 可执行文件 `add_executable()`
>
> 2. 动态库 `add_library(SHARED)`，默认的是动态库 `BUILD_SHARED_LIBS`
>
> 3. 静态库 `add_library(STATIC)`
>
> 4. 目标库、接口库、别名库、导入库 `add_library(OBJECT | INTERFACE | ALIAS | IMPORTED [GLOBAL])`

##### Target_XXX()
```makefile
target_link_libraries(<target>
                      <PRIVATE|PUBLIC|INTERFACE> <item> ...
                     [<PRIVATE|PUBLIC|INTERFACE> <item> ...]...)
```

#### 避免使用的一些操作
##### 不要使用宏定义的
> `add_definitions()`
>
> `add_compile_options()`
>
> `include_directories()`
>
> `link_directories()`
>
> `link_libraries()`

##### 不要使用全局的文件
##### 避免使用不必要的变量

#### 创建和安装包
```shell
mkdir src/build
cd src/build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=~/.local ..
cmake --build . --target install
```

#### 创建和测试流程
```shell
mkdir test/build
cd test/build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=~/.local ..
ctest -W
```

#### Modern CMake 示例

##### 示例-1

```MakeFile
find_package(Boost REQUIRED COMPONENTS thread system)

target_link_libraries(mylib Boost::thread)
```

##### 示例-2
```Makefile
add_library(mylib STATIC
    mylib.h
    mylib.cpp
)

if(CMAKE_SYSTEM_NAME STREQUAL “Android”)
    target_sources(mylib
        PRIVATE mylib_android.cpp)
endif()
```

##### 示例-3
```Makefile
get_property(mylib_sources
    TARGET mylib
    PROPERTY SOURCES
)

message(“mylib: ${mylib_sources})”)

set_property(TEST mytest
    PROPERTY WILL_FAIL TRUE
)

set_property(SOURCE test.cpp
    PROPERTY COMPILE_FLAGS “-Wall”
)

```

##### 示例-4
```Makefile
set_property(TARGET mylib
    PROPERTY OUTPUT_NAME “mylib$< CONFIG>”
)

add_library(mylib STATIC
    mylib.cpp
    $<IF:$<PLATFORM_ID:Android>, android.cpp>
    $<IF:$<PLATFORM_ID:Windows>, windows.cpp>
)
```

##### 示例-5
```Makefile
set(CMAKE_SYSTEM_NAME Android)

set(CMAKE_SYSTEM_VERSION 21) # API level

set(CMAKE_ANDROID_ARCH_ABI arm64-v8a)

set(CMAKE_ANDROID_NDK /path/to/android-ndk)

set(CMAKE_ANDROID_STL_TYPE gnustl_static)

find_program(CLANG_TIDY_BIN
    NAMES “clang-tidy”
)

set(CLANG_TIDY_RUN “${CLANG_TIDY_BIN}”
    “-checks=-*, bugprone-*, cppcoreguidelines-*”
)

set_property(TARGET mylib
    PROPERTY CXX_CLANG_TIDY ${CLANG_TIDY_RUN}”
)

find_program(IWYU_BIN
    NAMES “iwyu”
)

set_property(TARGET mylib
    PROPERTY CXX_INCLUDE_WHAT_YOU_USE
    “${IWYU_BIN}” “--transitive_includes_only”
)
```

#### Cmake 外部依赖库管理
> 1. [Conan](https://conan.io/)：Conan, the C / C++ Package Manager for Developers.
>
> 2. [vcpkg](https://github.com/Microsoft/vcpkg)：C++ Library Manager for Windows, Linux, and MacOS.
>
> 3. [Hunter](https://github.com/cpp-pm/hunter)：CMake driven cross-platform package manager for C/C++.

#### 本项目使用 submodule 信息
> 1. `git submodule add https://github.com/protocolbuffers/protobuf.git 3rd_libs/include/protobuf`
>
> 2. `git submodule add https://github.com/google/googletest.git 3rd_libs/include/googletest`
>
> 3. `git submodule add https://github.com/google/glog.git  3rd_libs/include/glog`
>
> 4. `git submodule add https://github.com/gflags/gflags.git  3rd_libs/include/gflags`
>
> 5. `git submodule add https://github.com/chriskohlhoff/asio.git  3rd_libs/include/asio`
