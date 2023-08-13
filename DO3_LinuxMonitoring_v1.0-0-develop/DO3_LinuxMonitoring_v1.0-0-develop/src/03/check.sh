#!/bin/bash

if [[ "$1" == "$2" ]] || [[ "$3" == "$4" ]] #check double values
then
    echo "Attention: You have entered arguments of the same column color, please restart the script with different values: 1-6!"
elif ! [[ $1 =~ ^[1-6]$ ]]
then
    echo "Error: invalid format: \""$1"\", please restart the script with different values: 1-6!"
elif ! [[ $2 =~ ^[1-6]$ ]]
then
    echo "Error: invalid format: \""$2"\", please restart the script with different values: 1-6!"
elif ! [[ $3 =~ ^[1-6]$ ]]
then
    echo "Error: invalid format: \""$3"\", please restart the script with different values: 1-6!"
elif ! [[ $4 =~ ^[1-6]$ ]]
then
    echo "Error: invalid format: \""$4"\", please restart the script with different values: 1-6!"
else
case "$1" in
    1)FRONT_1=$WHITE_F;;
    2)FRONT_1=$RED_F;;
    3)FRONT_1=$GREEN_F;;
    4)FRONT_1=$BLUE_F;;
    5)FRONT_1=$PURPULE_F;;
    6)FRONT_1=$BLACK_F;;
esac
case "$2" in
    1)BACK_1=$WHITE_B;;
    2)BACK_1=$RED_B;;
    3)BACK_1=$GREEN_B;;
    4)BACK_1=$BLUE_B;;
    5)BACK_1=$PURPULE_B;;
    6)BACK_1=$BLACK_B;;
esac
case "$3" in
    1)FRONT_2=$WHITE_F;;
    2)FRONT_2=$RED_F;;
    3)FRONT_2=$GREEN_F;;
    4)FRONT_2=$BLUE_F;;
    5)FRONT_2=$PURPULE_F;;
    6)FRONT_2=$BLACK_F;;
esac
case "$4" in
    1)BACK_2=$WHITE_B;;
    2)BACK_2=$RED_B;;
    3)BACK_2=$GREEN_B;;
    4)BACK_2=$BLUE_B;;
    5)BACK_2=$PURPULE_B;;
    6)BACK_2=$BLACK_B;;
esac

export HOSTNAME="$(hostname)"
    echo -e "${FRONT_1}${BACK_1}HOSTNAME${END} = ${FRONT_2}${BACK_2}$HOSTNAME${END}"
export TIMEZONE="$(timedatectl | grep "Time zone"| xargs)"
    echo -e "${FRONT_1}${BACK_1}TIMEZONE${END} = ${FRONT_2}${BACK_2}$TIMEZONE${END}"
export USER="$(whoami)"
    echo -e "${FRONT_1}${BACK_1}USER${END} = ${FRONT_2}${BACK_2}$USER${END}"
export OS="$(cat /etc/issue | xargs|  tr -s "n l" ' ')"
    echo -e "${FRONT_1}${BACK_1}OS${END} = ${FRONT_2}${BACK_2}$OS${END}"
export DATE="$(date)"
    echo -e "${FRONT_1}${BACK_1}DATE${END} = ${FRONT_2}${BACK_2}$DATE${END}"
export UPTIME="$(uptime -p)"
    echo -e "${FRONT_1}${BACK_1}UPTIME${END} = ${FRONT_2}${BACK_2}$UPTIME${END}"
export UPTIME_SEC="$(awk '{print $1}' /proc/uptime)"
    echo -e "${FRONT_1}${BACK_1}UPTIME_SEC${END} = ${FRONT_2}${BACK_2}$UPTIME_SEC${END}"
export IP="$(ip a | grep "inet"| sed -n 1p| xargs)"
    echo -e "${FRONT_1}${BACK_1}IP${END} = ${FRONT_2}${BACK_2}$IP${END}"
export MASK="$(ifconfig | grep netmask|sed -n 2p| xargs)"
    echo -e "${FRONT_1}${BACK_1}MASK${END} = ${FRONT_2}${BACK_2}$MASK${END}"
export GATEWAY="$(ip -4 route show default)"
    echo -e "${FRONT_1}${BACK_1}GATEWAY${END} = ${FRONT_2}${BACK_2}$GATEWAY${END}"
export RAM_TOTAL="$(grep MemTotal /proc/meminfo | xargs)"
    echo -e "${FRONT_1}${BACK_1}RAM_TOTAL${END} = ${FRONT_2}${BACK_2}$RAM_TOTAL${END}"
export RAM_USED="$(vmstat -s| grep "used m" | xargs)"
    echo -e "${FRONT_1}${BACK_1}RAM_USED${END} = ${FRONT_2}${BACK_2}$RAM_USED${END}"
export RAM_FREE="$(grep MemFree /proc/meminfo | xargs)"
    echo -e "${FRONT_1}${BACK_1}RAM_FREE${END} = ${FRONT_2}${BACK_2}$RAM_FREE${END}"
export SPACE_ROOT="$(df -hmT | awk '/\/$/ {printf "%.2f MB", $3}' )"
    echo -e "${FRONT_1}${BACK_1}SPACE_ROOT${END} = ${FRONT_2}${BACK_2}$SPACE_ROOT${END}"
export SPACE_ROOT_USED="$(df -hmT | awk '/\/$/ {printf "%.2f MB", $4/1024}')"
    echo -e "${FRONT_1}${BACK_1}SPACE_ROOT_USED${END} = ${FRONT_2}${BACK_2}$SPACE_ROOT_USED${END}"
export SPACE_ROOT_FREE="$(df -hmT | awk '/\/$/ {printf "%.2f MB", $5/1024}')"
    echo -e "${FRONT_1}${BACK_1}SPACE_ROOT_FREE${END} = ${FRONT_2}${BACK_2}$SPACE_ROOT_FREE${END}"
fi