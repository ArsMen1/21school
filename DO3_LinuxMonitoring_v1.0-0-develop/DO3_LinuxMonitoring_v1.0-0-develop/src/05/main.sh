#!/bin/bash
. ./functions.sh

time_work_script=`date +%s`

if [[ -n $1 ]]
then
    if [[ -d $1 ]]
    then
        if [[ ${1: -1} = "/" ]]
        then
            Total_number_of_folders $1
            TOP_5_folders $1
            Total_number_of_files $1
            Number_configure_files $1
            Top_ten_files_large_weight $1
            Top_ten_executables_files $1
            Time_execution_script $time_work_script
        else
            echo "Attention: you need to add the '/' character at the end!"
        fi
    else
        echo "Attention: you need to enter the path to the directory!"
    fi
else
    echo "Attention: you need to enter one parameter is required in the form: '/some folder/'"
fi
