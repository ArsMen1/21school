#!/bin/bash

counter_color(){
case $column1_font_color in
    1)
    FRONT_1=$WHITE_F
        color_name_1="white"
        color_text_1="1";;
    2)
    FRONT_1=$RED_F
        color_name_1="red"
        color_text_1="2";;
    3)
    FRONT_1=$GREEN_F
        color_name_1="green"
        color_text_1="3";;
    4)
    FRONT_1=$BLUE_F
        color_name_1="blue"
        color_text_1="4";;
    5)
    FRONT_1=$PURPULE_F
        color_name_1="purpule"
        color_text_1="5";;
    6)
    FRONT_1=$BLACK_F
        color_name_1="black"
        color_text_1="1";;
    *)
    FRONT_1=$BLACK_F
    color_name_1="black"
    color_text_1="default";;
esac
case $column1_background in
    1)
    BACK_1=$WHITE_B
        color_name_2="white"
        color_text_2="1";;
    2)
    BACK_1=$RED_B
        color_name_2="red"
        color_text_2="2";;
    3)
    BACK_1=$GREEN_B
        color_name_2="green"
        color_text_2="3";;
    4)
    BACK_1=$BLUE_B
        color_name_2="blue"
        color_text_2="4";;
    5)
    BACK_1=$PURPULE_B
        color_name_2="purpule"
        color_text_2="5";;
    6)
    BACK_1=$BLACK_B
        color_name_2="black"
        color_text_2="1";;
    *)
    BACK_1=$WHITE_B
    color_name_2="white"
    color_text_2="default";;
esac
case $column2_font_color in
    1)
    FRONT_2=$WHITE_F
        color_name_3="white"
        color_text_3="1";;
    2)
    FRONT_2=$RED_F
        color_name_3="red"
        color_text_3="2";;
    3)
    FRONT_2=$GREEN_F
        color_name_3="green"
        color_text_3="3";;
    4)
    FRONT_2=$BLUE_F
        color_name_3="blue"
        color_text_3="4";;
    5)
    FRONT_2=$PURPULE_F
        color_name_3="purpule"
        color_text_3="5";;
    6)
    FRONT_2=$BLACK_F
        color_name_3="black"
        color_text_3="1";;
    *)
    FRONT_2=$RED_F
    color_name_3="red"
    color_text_3="default";;
esac
case $column2_background in
    1)
    BACK_2=$WHITE_B
        color_name_4="white"
        color_text_4="1";;
    2)
    BACK_2=$RED_B
        color_name_4="red"
        color_text_4="2";;
    3)
    BACK_2=$GREEN_B
        color_name_4="green"
        color_text_4="3";;
    4)
    BACK_2=$BLUE_B
        color_name_4="blue"
        color_text_4="4";;
    5)
    BACK_2=$PURPULE_B
        color_name_4="purpule"
        color_text_4="5";;
    6)
    BACK_2=$BLACK_B
        color_name_4="black"
        color_text_4="1";;
    *)
    BACK_2=$BLUE_B
    color_name_4="blue"
    color_text_4="default";;
esac
}

