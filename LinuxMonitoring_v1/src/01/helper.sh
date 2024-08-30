#!/bin/bash

greet() {
    param=$1
    if echo "$param" | grep -q "[[:alpha:]]"; then
        echo "Привет, $param!"
    else
        echo "Введен неверный параметр."
    fi
}
