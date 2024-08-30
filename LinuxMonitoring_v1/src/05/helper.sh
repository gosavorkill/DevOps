#!/bin/bash

directory="$1"

if [ "${directory: -1}" != "/" ]; then
    echo "Параметр должен заканчиваться знаком '/'"
    exit 1
fi

if [ ! -d "$directory" ]; then
    echo "Указанная директория не существует"
    exit 1
fi

total_folders=$(find "$directory" -mindepth 1 -type d 2>/dev/null | wc -l)
echo "Total number of folders (including all nested ones) = $total_folders"

folder_sizes=$(du -sh "$directory"*/ 2>/dev/null | sort -rh)
echo "TOP 5 folders of maximum size arranged in descending order (path and size): "
echo "$folder_sizes" | head -n 5 | awk -F'\t' '{printf "%d - %s, %s\n", NR, $2, $1}'

total_files=$(find "$directory" -type f 2>/dev/null | wc -l)
echo "Total number of files = $total_files"

config_files=$(find "$directory" -type f -name "*.conf" 2>/dev/null | wc -l)
echo "Number of:"
echo "  Configuration files (with the .conf extension) = $config_files"

text_files=$(find "$directory" -type f -name "*.txt" 2>/dev/null | wc -l)
echo "  Text files = $text_files"

executable_files=$(find "$directory" -type f -executable 2>/dev/null | wc -l)
echo "  Executable files = $executable_files"

log_files=$(find "$directory" -type f -name "*.log" 2>/dev/null | wc -l)
echo "  Log files (with the extension .log) = $log_files"

archive_files=$(find "$directory" -type f \( -name "*.zip" -o -name "*.tar" -o -name "*.gz" \) 2>/dev/null | wc -l)
echo "  Archive files = $archive_files"

symbolic_links=$(find "$directory" -type l 2>/dev/null | wc -l)
echo "  Symbolic links = $symbolic_links"

echo "TOP 10 files of maximum size arranged in descending order (path, size, and type):"
find "$directory" -type f -mindepth 1 -exec du -ah {} + 2>/dev/null | sort -rh | head -n 10 | awk -F'\t' '{printf "%d - %s, %s, %s\n", NR, $2, $1, substr($2, length($2)-2, 3)}'

echo "TOP 10 executable files of the maximum size arranged in descending order (path, size, and MD5 hash of file):"
find "$directory" -type f -executable -exec du -ah {} + 2>/dev/null | sort -rh | head -n 10 | while read -r size file; do
  if [[ -n $size ]]; then
    count=$((count+1))
    hash=$(md5sum "$file" | cut -d' ' -f1)
    echo "$count - $file, $size, $hash"
  fi
done
