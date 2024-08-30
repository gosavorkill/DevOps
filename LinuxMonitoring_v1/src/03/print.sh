#!/bin/bash
print_hostname () {
    echo -e "${text_color1}${fone_color1}HOSTNAME${RESET} = ${text_color2}${fone_color2}$(hostname)${RESET}"
}

print_timezone () {
    echo -e "${text_color1}${fone_color1}TIMEZONE${RESET} = ${text_color2}${fone_color2}$(timedatectl | grep "Time zone" | awk -F: '{print $2}')${RESET}"
}

print_os () {
    echo -e "${text_color1}${fone_color1}OS${RESET} = ${text_color2}${fone_color2}$(hostnamectl | grep "Operating System" | awk -F: '{print $2}')${RESET}"
}

print_date () {
    echo -e "${text_color1}${fone_color1}DATE${RESET} = ${text_color2}${fone_color2}$(date)${RESET}"
}

print_name () {
    echo -e "${text_color1}${fone_color1}USER${RESET} = ${text_color2}${fone_color2}$(whoami)${RESET}"
}

print_uptime () {
    echo -e "${text_color1}${fone_color1}UPTIME${RESET} = ${text_color2}${fone_color2}$(uptime | awk -F, '{print$1}' | awk '{print$3}')${RESET}"

}
print_uptimesec () {
    echo -e "${text_color1}${fone_color1}UPTIME_SEC${RESET} = ${text_color2}${fone_color2}$(cat /proc/uptime | awk '{print $1}')${RESET}"
}

print_ip () {
    echo -e "${text_color1}${fone_color1}IP${RESET} = ${text_color2}${fone_color2}$(hostname -I)${RESET}"
}

print_mask () {
    echo -e "${text_color1}${fone_color1}MASK${RESET} = ${text_color2}${fone_color2}$(ifconfig enp0s3 | grep -oP 'netmask \K\S+')${RESET}"
}

print_gateway () {
    echo -e "${text_color1}${fone_color1}GATEWAY${RESET} = ${text_color2}${fone_color2}$(ip route | grep default | awk '{print $3}')${RESET}"
}

print_ramtotal () {
    echo -e "${text_color1}${fone_color1}RAM_TOTAL${RESET} = ${text_color2}${fone_color2}$(free -h | awk '/^Mem:/ {printf "%.3f GB\n", $2/1024}')${RESET}"
}

print_ramused () {
    echo -e "${text_color1}${fone_color1}RAM_USED${RESET} = ${text_color2}${fone_color2}$(free -h | awk '/^Mem:/ {printf "%.3f GB\n", $3/1024}')${RESET}"
}

print_ramfree () {
    echo -e "${text_color1}${fone_color1}RAM_FREE${RESET} = ${text_color2}${fone_color2}$(free -h | awk '/Mem:/ {printf "%.3f GB\n", $4/1024}')${RESET}"
}

print_spaceroot () {
    echo -e "${text_color1}${fone_color1}SPACE_ROOT${RESET} = ${text_color2}${fone_color2}$(df / | awk 'NR==2{printf "%.2f MB", $2/1024}')${RESET}"
}

print_spacerootused () {
    echo -e "${text_color1}${fone_color1}SPACE_ROOT_USED${RESET} = ${text_color2}${fone_color2}$(df / | awk 'NR==2{printf "%.2f MB", $3/1024}')${RESET}"
}
print_spacerootfree () {
    echo -e "${text_color1}${fone_color1}SPACE_ROOT_FREE${RESET} = ${text_color2}${fone_color2}$(df / | awk 'NR==2{printf "%.2f MB", $4/1024}')${RESET}"
}
print_hostname
print_timezone
print_name
print_os
print_date
print_uptime
print_uptimesec
print_ip
print_mask
print_gateway
print_ramtotal
print_ramused
print_ramfree
print_spaceroot
print_spacerootused
print_spacerootfree
