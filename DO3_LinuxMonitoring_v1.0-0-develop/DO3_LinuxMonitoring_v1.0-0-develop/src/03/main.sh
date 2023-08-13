#!/bin/bash

. ./colors.sh

if [[ $# -ne 4 ]]
then
    echo "Attention! Need 4 arguments values: 1-6!"
else
chmod +x ./check.sh
./check.sh "$1" "$2" "$3" "$4"
fi