#!/bin/bash
echo""
if [ "$def1" = 1 ]; then
     echo "Column 1 background = default ${col1}"
else echo "Column 1 background = $background_name ${col1}"
fi

if [ "$def2" = 1 ]; then
     echo "Column 1 font color = default ${col2}"
else echo "Column 1 font color = $foreground_name ${col2}"
fi

if [ "$def3" = 1 ]; then
     echo "Column 2 background = default ${col3}"
else echo "Column 2 background = $background_value ${col3}"
fi

if [ "$def4" = 1 ]; then
     echo "Column 2 font color = default ${col4}"
else echo "Column 2 font color = $foreground_value ${col4}"
fi

