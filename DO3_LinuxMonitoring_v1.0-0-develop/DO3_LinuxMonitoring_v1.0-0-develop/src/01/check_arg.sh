#!/bin/bash

if [[ $1 =~ ^[-+]?[0-9]+([.,][0-9]+)?$ ]]
then
        echo "Error : argument must be text!"
else
        echo $1
fi

: '
https://stackoverflow.com/questions/806906/how-do-i-test-if-a-variable-is-a-number-in-bash
'