#!/bin/bash
if [ "$#" -ne 4 ]; then
    echo "Error: Invalid number of parameters. Try again and enter the 4 parameters as numbers."
    exit 1
fi

. "$(dirname "$0")/helper.sh"
greet

text_color1=${BLUE}
text_color2=${BG_PURPLE}
fone_color1=${BG_RED}
fone_color2=${BG_BLUE}

background_name=${1}
foreground_name=${2}
background_value=${3}
foreground_value=${4}

if [ "${background_name}" = "${foreground_name}" ] || [ "${background_value}" = "${foreground_value}" ]; then
    echo "Error: Font and background colors for the same value should not match."
    exit 1
fi

. "$(dirname "$0")/colors.sh"
. "$(dirname "$0")/print.sh"
