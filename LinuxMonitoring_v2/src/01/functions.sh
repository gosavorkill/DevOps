#!/bin/bash

inputFile="log.txt"
sudo touch $inputFile

function arguments {
    end=$(echo $absolute_path | head -c 1)
        if [[ "$end" != "/" ]]; then
            echo "Ошибка {$absolute_path}: путь введён некорректно!"
            exit 1
        fi

        if [[ $number_of_folders =~ [^0-9] ]]; then
            echo "Ошибка {$number_of_folders}: колличество вложенных папок некорректно!"
            exit 1
        fi

        export count=${#letters_for_folders}
        if [[ ($count -gt 7) ]]; then
            echo "Ошибка {$letters_for_folders}: в названии папок должно быть не более 7 знаков!"
            exit 1
        fi

        if [[ $letters_for_folders =~ [^A-Za-z] ]]; then
            echo "Ошибка {$letters_for_folders}: можно использовать только латиницу!"
            exit 1
        fi

        if [[ $number_of_files =~ [^0-9] ]]; then
            echo "Ошибка {$number_of_files}: введенное колличество файлов некорректно!"
            exit 1
        fi

        if [[ $number_of_files -gt 100 ]]; then
            echo "Ошибка {$number_of_files}: папки засорены файлами!"
            exit 1
        fi

        if [[ ! "$letters_for_files" =~ ^([a-zA-Z]{1,7}).([a-zA-Z]{1,3})$ ]]; then
            echo "Ошибка {$letters_for_files}: для имени файла - не более 7 знаков, для расширения - не более 3 знаков!"
            exit 1
        fi

        filesize=$file_size

        onlysize=${filesize%kb}
        if [[ ! "$file_size" =~ ^([0-9]+kb)$ ]]; then
            echo "Ошибка {$file_size}: формат размера файла введён некорректно!"
            exit 1
        fi

        if [[ ! $onlysize > 0 || ! $onlysize -le 100 ]]; then
            echo "Ошибка {$file_size}: размер файлов должен быть не более 100Кб!"
            exit 1
        fi
}

function create {
    folder=$letters_for_folders
    filename=$(echo $letters_for_files | awk -F. '{print $1}')
    fileExt=$(echo $letters_for_files | awk -F. '{print $2}')
    lastNameFolder=${letters_for_folders: -1}
    fileName=$filename
    oldName=$fileName
    lastNameFiles=${fileName: -1} #обратный порядок
    logDate="$(date +"%d%m%y")"
    newDate="DATE = $(date +"%d.%m.%y")"

    if [[ ${#folder} -lt 4 ]]; then
        for (( i=${#folder}; i<4; i++ )); do
            folder+="$(echo $lastNameFolder)"
        done
    fi

    for (( i=1; i<=$number_of_folders; i++ )); do
        sudo mkdir -p "$absolute_path/"$folder"_"$logDate""
        for (( j=1; j<=$number_of_files; j++ )); do
            sudo fallocate -l $filesize ""$absolute_path"/"$folder"_"$logDate"/"$fileName"."$fileExt"_"$logDate""
            line=""$newDate" | "$letters_for_folders"/"$folder"_"$logDate"/"$fileName"."$fileExt"_"$logDate" | Size of file = ${filesize}."
            echo "$line" | sudo tee -a $inputFile # tee -a добавляет строку в конец файла
            fileName+="$(echo $lastNameFiles)" #добавляет последний символ к названию
        done
        fileName=$oldName
        folder+="$(echo $lastNameFolder)" #добавляет последний символ к названию
    done
}

arguments
create