#!/bin/bash
current_datetime=$(date +"%Y-%m-%d_%H-%M-%S")
print_hostname () {
    echo "HOSTNAME = $(hostname)" >> $current_datetime.status
}

print_timezone () {
    echo "TIMEZONE =$(timedatectl | grep "Time zone" | awk -F: '{print $2}')" >> $current_datetime.status
}

print_os () {
    echo "OS =$(hostnamectl | grep "Operating System" | awk -F: '{print $2}')" >> $current_datetime.status
}

print_date () {
    echo "DATE = $(date)" >> $current_datetime.status
}

print_name () {
    echo "USER =$(whoami)" >> $current_datetime.status
}

print_uptime () {
    echo "UPTIME = $(uptime | awk -F, '{print$1}' | awk '{print$3}')" >> $current_datetime.status

}
print_uptimesec () {
    echo "UPTIME_SEC = $(cat /proc/uptime | awk '{print $1}')" >> $current_datetime.status
}

print_ip () {
    echo "IP = $(hostname -I)" >> $current_datetime.status
}

print_mask () {
    echo "MASK = $(ifconfig enp0s3 | grep -oP 'netmask \K\S+')" >> $current_datetime.status
}

print_gateway () {
    echo "GATEWAY = $(ip route | grep default | awk '{print $3}')" >> $current_datetime.status
}

print_ramtotal () {
    echo "RAM_TOTAL = $(free -h | awk '/^Mem:/ {printf "%.3f GB\n", $2/1024}')" >> $current_datetime.status
}

print_ramused () {
    echo  "RAM_USED = $(free -h | awk '/^Mem:/ {printf "%.3f GB\n", $3/1024}')" >> $current_datetime.status
}

print_ramfree () {
    echo "RAM_FREE = $(free -h | awk '/Mem:/ {printf "%.3f GB\n", $4/1024}')" >> $current_datetime.status
}

print_spaceroot () {
    echo "SPACE_ROOT = $(df / | awk 'NR==2{printf "%.2f MB", $2/1024}')" >> $current_datetime.status
}

print_spacerootused () {
    echo "SPACE_ROOT_USED = $(df / | awk 'NR==2{printf "%.2f MB", $3/1024}')" >> $current_datetime.status
}
print_spacerootfree () {
    echo "SPACE_ROOT_FREE  = $(df / | awk 'NR==2{printf "%.2f MB", $4/1024}')" >> $current_datetime.status
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

