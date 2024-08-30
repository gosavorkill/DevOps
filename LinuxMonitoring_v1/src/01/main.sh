#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Скрипт должен быть запущен с одним параметром."
    exit 1;
fi

param=$1
. "$(dirname "$0")/helper.sh"
greet "$param"
