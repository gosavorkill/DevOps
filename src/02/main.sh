#!/bin/bash

export start=$(date +%s%N)
export time=$(date +%H:%M)

if [[ $# == 3 ]]; then
    export letters_for_folders=$1
    export letters_for_files=$2
    export file_size=$3
    ./functions.sh
else
    echo "Ошибка!"
fi

# sudo chmod +x ./main.sh
# sudo chmod +x ./functions.sh