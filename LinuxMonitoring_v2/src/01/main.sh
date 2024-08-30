#!/bin/bash

if [[ $# == 6 ]]; then
    export absolute_path=$1
    export number_of_folders=$2
    export letters_for_folders=$3
    export number_of_files=$4
    export letters_for_files=$5
    export file_size=$6
    ./functions.sh
else
    echo "Ошибка!"
fi

# sudo chmod +x ./main.sh
# sudo chmod +x ./functions.sh