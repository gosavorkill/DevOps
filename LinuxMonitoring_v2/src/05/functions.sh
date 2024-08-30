#!/bin/bash

if [[ $input == 1 ]]; then
    for (( i=1; i < 6; i++ )); do
        sort -k 9 ../04/$i.log -o sort$i.log #сортировка по 9му полю
        cat sort$i.log
    done
elif [[ $input == 2 ]]; then
    for (( i = 1; i < 6; i++ )); do
        awk '{print $1}' ../04/$i.log | sort -u > sort$i.log # -u  -уникальные значения
        cat sort$i.log
    done
elif [[ $input == 3 ]]; then
    for (( i = 1; i < 6; i++ )); do
        awk '$9 ~ /^4[0-9][0-9]|^5[0-9][0-9]$/' ../04/$i.log > sort$i.log
        cat sort$i.log
    done
elif [[ $input == 4 ]]; then
    for (( i = 1; i < 6; i++ )); do
        awk '$9 ~ /^4[0-9][0-9]|^5[0-9][0-9]$/' ../04/$i.log > sort$i.log
        awk '{print $1}' ../04/$i.log | sort -u > sort$i.log
        sudo rm -rf temp.log
        cat sort$i.log
    done
else
    echo "Ошибка! ${input} Используейте параметры в промежутке от 1 до 4"
    exit
fi