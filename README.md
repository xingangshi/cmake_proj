# cmake_proj

----

#### Cmake 基础
##### 1. commands
> cmmmand_name(space seperated list of strings)

##### 2,Variable
> set(hello world)
>
> mesage(STATUS "hello, ${hello})

##### 3. 流程控制
> if() / elseif() / else() / endif()
>
> foreach() / endforeach()
>
> while() / endwhile()
>
> break() / continue() / return()
>
> Comments start with #

##### 4. 其他
> include(<file>)
>
> add_subdirectory(<dir>)
>
> message(<txt>)
>
> add_excutable()
>
> file([WRITE|READ] <file> <content>)


#### Cmake Notes

> 1. 外部或者第三方的目录 add_subdirectory()
>
> 2. 第三方的库使用 ·git submodules· 添加的，使用 add_subdirectory()
>
> 3. ExternalProject_Add()，使用 add_subdirectory()
>
> 4. 下载和安装的第三方库，使用 find_package()

####  Cmake 的各种目标类型
> 1. 可执行文件 add_excutable
>
> 2. 动态库 add_library(SHARED)，默认的是动态库 BUILD_SHARED_LIBS
>
> 3. 静态库 add_library(STATIC)
>
> 4. 目标库、接口库、别名库、导入库 add_library(OBJECT | INTERFACE | ALIAS | IMPORTED [GLOBAL])

#### Target_XXX()
'''python
target_link_libraries(<target>
                      <PRIVATE|PUBLIC|INTERFACE> <item> ...
                     [<PRIVATE|PUBLIC|INTERFACE> <item> ...]...)
'''

#### 避免使用的一些操作
##### 不要使用宏定义的
> add_definitions()
>
> add_compile_options()
>
> include_directories()
>
> link_directories()
>
> link_libraries()

##### 不要使用全局的文件
##### 避免使用不必要的变量

#### 创建和安装包
'''
mkdir src/build

cd src/build

cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=~/.local ..

cmake --build . --target install
'''

#### 创建和测试流程
'''
mkdir test/build

cd test/build

cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=~/.local ..

ctest -W
'''


#### 使用 submodule 信息
> 1. `git submodule add https://github.com/protocolbuffers/protobuf.git 3rd_libs/include/protobuf`
>
> 2. `git submodule add https://github.com/google/googletest.git 3rd_libs/include/googletest`
>
> 3. `git submodule add https://github.com/google/glog.git  3rd_libs/include/glog`
>
> 4. `git submodule add https://github.com/gflags/gflags.git  3rd_libs/include/gflags`
>
> 5. `git submodule add https://github.com/chriskohlhoff/asio.git  3rd_libs/include/asio`
