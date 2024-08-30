#!/bin/bash
if [ "${background_name}" = "1" ]; then
    fone_color1="${BG_WHITE}"
elif [ "${background_name}" = "2" ]; then
    fone_color1="${BG_RED}"
elif [ "${background_name}" = "3" ]; then
    fone_color1="${BG_GREEN}"
elif [ "${background_name}" = "4" ]; then
    fone_color1="${BG_BLUE}"
elif [ "${background_name}" = "5" ]; then
    fone_color1="${BG_PURPLE}"
elif [ "${background_name}" = "6" ]; then
    fone_color1="${BG_BLACK}"
else echo "Error! Try again and enter the 4 parameters as numbers (1-6)."
     exit 1
fi

if [ "${foreground_name}" = "1" ]; then
    text_color1="${WHITE}"
elif [ "${foreground_name}" = "2" ]; then
    text_color1="${RED}"
elif [ "${foreground_name}" = "3" ]; then
    text_color1="${GREEN}"
elif [ "${foreground_name}" = "4" ]; then
    text_color1="${BLUE}"
elif [ "${foreground_name}" = "5" ]; then
    text_color1="${PURPLE}"
elif [ "${foreground_name}" = "6" ]; then
    text_color1="${BLACK}"
else echo "Error! Try again and enter the 4 parameters as numbers (1-6)."
     exit 1
fi


if [ "${background_value}" = "1" ]; then
    fone_color2="${BG_WHITE}"
elif [ "${background_value}" = "2" ]; then
    fone_color2="${BG_RED}"
elif [ "${background_value}" = "3" ]; then
    fone_color2="${BG_GREEN}"
elif [ "${background_value}" = "4" ]; then
    fone_color2="${BG_BLUE}"
elif [ "${background_value}" = "5" ]; then
    fone_color2="${BG_PURPLE}"
elif [ "${background_value}" = "6" ]; then
    fone_color2="${BG_BLACK}"
else echo "Error! Try again and enter the 4 parameters as numbers (1-6)."
     exit 1
fi


if [ "${foreground_value}" = "1" ]; then
    text_color2="${WHITE}"
elif [ "${foreground_value}" = "2" ]; then
    text_color2="${RED}"
elif [ "${foreground_value}" = "3" ]; then
    text_color2="${GREEN}"
elif [ "${foreground_value}" = "4" ]; then
    text_color2="${BLUE}"
elif [ "${foreground_value}" = "5" ]; then
    text_color2="${PURPLE}"
elif [ "${foreground_value}" = "6" ]; then
    text_color2="${BLACK}"
else echo "Error! Try again and enter the 4 parameters as numbers (1-6)."
     exit 1
fi

