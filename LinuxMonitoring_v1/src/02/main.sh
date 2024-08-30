#!/bin/bash
 if [ "$#" -ne 0 ]; then
    echo "Error: Invalid number of parameters."
    exit 1
fi
. "$(dirname "$0")/savefile.sh"
. "$(dirname "$0")/print.sh"
. "$(dirname "$0")/helper.sh"
greet

