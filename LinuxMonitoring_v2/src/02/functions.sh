#!/bin/bash

inputFile="log2.txt"
sudo touch $inputFile

function arguments {
    if [[ $letters_for_folders =~ [^A-Za-z] ]]; then
        echo "Ошибка {$letters_for_folders}: папки названы некорректно!"
        exit
    fi

    if [[ ${#letters_for_folders} -gt 7 ]]; then
        echo "Ошибка {$letters_for_folders}: в названии папок должно быть не более 7 знаков!"
        exit
    fi

    if [[ ! "$letters_for_files" =~ ^([a-zA-Z]{1,7}).([a-zA-Z]{1,3})$ ]]; then
        echo "Ошибка {$letters_for_files}: для имени файла - не более 7 знаков, для расширения - не более 3 знаков!"
        exit
    fi

    export filesize=$(echo $file_size | awk -F"Mb" '{print $1}')
    if [[ ! ($file_size =~ Mb$) || ($filesize =~ [^0-9]) || ($filesize -gt 100) || ($filesize -le 0) ]]; then
        echo "Ошибка {$file_size}: формат размера файла введён некорректно!"
        exit 1
    fi
}

function spawn {
    START=$(date +%s%N) 
    start1=$(date +%H:%M)
    folder=$letters_for_folders
    folderRand="$(compgen -d / | shuf -n1)"
    fileExt=$(echo $letters_for_files | awk -F. '{print $2}')
    lastNameFolder=${letters_for_folders: -1}
    fileName=$(echo $letters_for_files | awk -F. '{print $1}')
    oldName=$fileName
    lastNameFiles=${fileName: -1}
    logDate="$(date +"%d%m%y")"
    newDate="$(date +"%d.%m.%y")"

    count=$(( $RANDOM % 100 + 1 ))

    if [[ ${#folder} -lt 5 ]]; then
        for (( i=${#folder}; i<5; i++ )); do
            folder+="$(echo $lastNameFolder)"
        done
    fi

    for (( i=1; i<=$count; i++ )); do
        folderRand="$(compgen -d / | shuf -n1 )"
        filesCounter="$(shuf -i 1-50 -n1)"
        if [[ $folderRand == "/bin" || $folderRand == "/sbin" || $folderRand == "/root" ||  $folderRand == "/proc" || $folderRand == "/sys" ]]; then
            count++
            continue
        fi
        sudo mkdir -p "$folderRand/"$folder"_"$logDate"" 2>/dev/null
        for (( j=1; j<=${filesCounter}; j++ )); do
            echo "заполнено $i/${count} директорий и создано $j/${filesCounter} файлов"
            freeSpace=$(df -BM / | awk 'NR==2 {print $4}' | tr -d 'M')
            if ((freeSpace < 1000)); then
                echo "Ошибка: Недостаточно свободного места на диске!"
                exit 1
            fi
            sudo fallocate -l ${filesize}M ""$folderRand"/"$folder"_"$logDate"/"$fileName"."$fileExt"_"$logDate"" 2>/dev/null
            line=""$newDate" | "$folderRand"/"$folder"_"$logDate" | "$fileName"."$fileExt"_"$logDate" | Размер файла = ${filesize} Mb.";
            echo "$line" | sudo tee -a $inputFile
            fileName+="$(echo $lastNameFiles)"
        done
        fileName=$oldName
        folder+="$(echo $lastNameFolder)"
    done
}

arguments
spawn

END=$(date +%s%N)
DIFF=$(( (END - START) / 1000000 ))
TIMES=$(date +%H:%M)
echo "" | sudo tee -a $inputFile
echo "Начало: $start1" | sudo tee -a $inputFile
echo "Конец: $TIMES" | sudo tee -a $inputFile
echo "Скрипт работал $DIFF мс" | sudo tee -a $inputFile