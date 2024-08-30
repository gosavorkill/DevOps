#!/bin/bash

if [[ $# == 1 ]]; then
    export input=$1
    ./functions.sh
else
    echo "Ошибка!"
fi

# sudo chmod +x ./main.sh
# sudo chmod +x ./functions.sh