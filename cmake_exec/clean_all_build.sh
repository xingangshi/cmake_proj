#!/usr/bin/bash

function getdir(){
    for element in `ls $1`
    do
        dir_or_file=$1"/"$element
        if [[ -d $dir_or_file && $2 == 1 ]]
        then
            getdir $dir_or_file 0
        else
            if [[ "$dir_or_file" == *"build" ]]
            then
                echo $dir_or_file
                rm -rf $dir_or_file
            fi
        fi
    done
}

root_dir="."
getdir $root_dir 1
