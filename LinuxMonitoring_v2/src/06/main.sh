#!/bin/bash
if [[ $# == 0 ]]; then
    echo "deb http://deb.goaccess.io/ $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list.d/goaccess.list
    wget -O - https://deb.goaccess.io/gnugpg.key | sudo apt-key --keyring /etc/apt/trusted.gpg.d/goaccess.gpg add -
    sudo apt update
    sudo apt install goaccess
    sudo goaccess ../04/*.log --log-format=COMBINED -a -o index.html
    if [ -s index.html ]; then
        echo "Данные в index.html"
    fi
    
else
    echo "n/a"
fi

# sudo chmod +x ./main.sh