#!/bin/bash
if [ "$#" -ne 0 ]; then
    echo "Error: Invalid number of parameters."
    exit 1
fi
column1_background=10
column1_font_color=10
column2_background=10
column2_font_color=10

. "$(dirname "$0")/helper.sh"
greet
. "$(dirname "$0")/value.conf"


. "$(dirname "$0")/check.sh"
. "$(dirname "$0")/colors.sh"
. "$(dirname "$0")/print1.sh"
. "$(dirname "$0")/print2.sh"
