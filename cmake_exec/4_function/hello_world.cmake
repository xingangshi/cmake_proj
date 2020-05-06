#!/usr/bin/env cmake -P

# From 1 to n
#
# if n multiple 3 print i
# if n multiple 5 print i
# else print 0


function(helloworld n)
    foreach(i RANGE 1 ${n})
        set(result "")
        math(EXPR hello "${i} % 3")
        math(EXPR world "${i} % 5")

        if(NOT hello)
            set(result 1)
        endif()

        if(NOT world)
            set(result 1)
        endif()


        if(result)
            set(result "num is ${i}, result ${i}")
        else()
            set(result "num is ${i}, result 0")
        endif()

       message("${result}")
    endforeach()
endfunction()

helloworld(15)
