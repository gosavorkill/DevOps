#!/bin/bash

date="$(cat ../02/log2.txt | awk -F'|' '{print $2}' | awk -F'_' '{print $3}')"

function arguments {

    if [[ "$input" -eq "1" ]]; then
        file="$(cat ../02/log2.txt | awk -F'|' '{print $2}')"
        for i in $file; do
            sudo rm -rf $i
            echo "${i}"
        done
        sudo rm -rf ../02/log2.txt
        echo "Все файлы, папки и сам файл log2.txt удалены"
        
    elif [[ "$input" -eq "2" ]]; then
        echo "Введите дату и время, с которого начинать удаление (YYYY-MM-DD HH:MM):"
        read srcDateStart srcTimeStart  
        echo "Введите дату и время, до которого удалять (YYYY-MM-DD HH:MM):"
        read srcDateFin srcTimeFin
        startDateTime="$srcDateStart $srcTimeStart"
        endDateTime="$srcDateFin $srcTimeFin"
        echo "Файлы которые будут удалены:"
        find / -type f -newermt "$startDateTime" ! -newermt "$endDateTime" -exec ls -l {} \;
        find / -type f -newermt "$startDateTime" ! -newermt "$endDateTime" -print0 | xargs -0 sudo rm -rf
        echo "Файлы успешно удалены"

    elif [[ "$input" -eq "3" ]]; then
        read -p "Введите паттерн для поиска (например, az): " search_pattern
        read -p "Введите дату для поиска (например, 250824): " search_date
        found_folders=$(find / -type d -name "${search_pattern}*_${search_date}")
        if [ -z "$found_folders" ]; then
        echo "Папки по заданному паттерну не найдены."
        else
    find / -type d -name "${search_pattern}*_${search_date}" -print0 | xargs -0 sudo rm -rf
    fi
    else 
        echo "Параметр введен неверно"
    fi
}

arguments