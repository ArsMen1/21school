#!/bin/bash

source counter.sh
counter_color


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

echo "
column 1 font color = $color_text_1 ($color_name_1)
column 1 background = $color_text_2 ($color_name_2)
column 2 font color = $color_text_3 ($color_name_3)
column 2 background = $color_text_4 ($color_name_4)"
