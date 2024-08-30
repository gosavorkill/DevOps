#!/bin/bash
text_color1=${BLUE}
text_color2=${BG_PURPLE}
fone_color1=${BG_RED}
fone_color2=${BG_BLUE}

if ((column1_background >= 1 && column1_background <= 6)); then
    background_name="$column1_background"
else
    background_name=5
    def1=1
fi


if ((column1_font_color >= 1 && column1_font_color <= 6)); then
    foreground_name="$column1_font_color"
else
    foreground_name=1
    def2=1
fi


if ((column2_background >= 1 && column2_background <= 6)); then
    background_value="$column2_background"
else
    background_value=2
    def3=1
fi

if ((column2_font_color >= 1 && column2_font_color <= 6)); then
    foreground_value="$column2_font_color"
else
    foreground_value=3
    def4=1
fi

if [ "${background_name}" = "${foreground_name}" ] || [ "${background_value}" = "${foreground_value}" ]; then
    echo "Error: Font and background colors for the same value should not match."
    exit 1
fi

