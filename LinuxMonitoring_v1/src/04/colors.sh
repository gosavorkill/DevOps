#!/bin/bash
if [ "${background_name}" = "1" ]; then
    fone_color1="${BG_WHITE}"
    col1="(white)"
elif [ "${background_name}" = "2" ]; then
    fone_color1="${BG_RED}"
    col1="(red)"
elif [ "${background_name}" = "3" ]; then
    fone_color1="${BG_GREEN}"
    col1="(green)"
elif [ "${background_name}" = "4" ]; then
    fone_color1="${BG_BLUE}"
    col1="(blue)"
elif [ "${background_name}" = "5" ]; then
    fone_color1="${BG_PURPLE}"
    col1="(purple)"
elif [ "${background_name}" = "6" ]; then
    fone_color1="${BG_BLACK}"
    col1="(black)"
else echo "Error! Check the values ​​specified in the file, they should be in the range 1-6."
     exit 1
fi

if [ "${foreground_name}" = "1" ]; then
    text_color1="${WHITE}"
    col2="(white)"
elif [ "${foreground_name}" = "2" ]; then
    text_color1="${RED}"
    col2="(red)"
elif [ "${foreground_name}" = "3" ]; then
    text_color1="${GREEN}"
    col2="(green)"
elif [ "${foreground_name}" = "4" ]; then
    text_color1="${BLUE}"
    col2="(blue)"
elif [ "${foreground_name}" = "5" ]; then
    text_color1="${PURPLE}"
    col2="(purple)"
elif [ "${foreground_name}" = "6" ]; then
    text_color1="${BLACK}"
    col2="(black)"
else echo "Error! Check the values ​​specified in the file, they should be in the range 1-6."
     exit 1
fi


if [ "${background_value}" = "1" ]; then
    fone_color2="${BG_WHITE}"
    col3="(white)"
elif [ "${background_value}" = "2" ]; then
    fone_color2="${BG_RED}"
    col3="(red)"
elif [ "${background_value}" = "3" ]; then
    fone_color2="${BG_GREEN}"
    col3="(green)"
elif [ "${background_value}" = "4" ]; then
    fone_color2="${BG_BLUE}"
    col3="(blue)"
elif [ "${background_value}" = "5" ]; then
    fone_color2="${BG_PURPLE}"
    col3="(purple)"
elif [ "${background_value}" = "6" ]; then
    fone_color2="${BG_BLACK}"
    col3="(black)"
else echo "Error! Check the values ​​specified in the file, they should be in the range 1-6."
     exit 1
fi


if [ "${foreground_value}" = "1" ]; then
    text_color2="${WHITE}"
    col4="(white)"
elif [ "${foreground_value}" = "2" ]; then
    text_color2="${RED}"
    col4="(red)"
elif [ "${foreground_value}" = "3" ]; then
    text_color2="${GREEN}"
    col4="(green)"
elif [ "${foreground_value}" = "4" ]; then
    text_color2="${BLUE}"
    col4="(blue)"
elif [ "${foreground_value}" = "5" ]; then
    text_color2="${PURPLE}"
    col4="(purple)"
elif [ "${foreground_value}" = "6" ]; then
    text_color2="${BLACK}"
    col4="(black)"
else echo "Error! Check the values ​​specified in the file, they should be in the range 1-6."
     exit 1
fi
