#!/bin/bash
print_hostname1 () {
    echo "HOSTNAME = $(hostname)"
}

print_timezone1 () {
    echo "TIMEZONE =$(timedatectl | grep "Time zone" | awk -F: '{print $2}')"
}

print_os1 () {
    echo "OS =$(hostnamectl | grep "Operating System" | awk -F: '{print $2}')"
}

print_date1 () {
    echo "DATE = $(date)"
}

print_name1 () {
    echo "USER =$(whoami)"
}

print_uptime1 () {
    echo "UPTIME = $(uptime | awk -F, '{print$1}' | awk '{print$3}')"

}
print_uptimesec1 () {
    echo "UPTIME_SEC = $(cat /proc/uptime | awk '{print $1}')"
}

print_ip1 () {
    echo "IP = $(hostname -I)"
}

print_mask1 () {
    echo "MASK = $(ifconfig enp0s3 | grep -oP 'netmask \K\S+')"
}

print_gateway1 () {
    echo "GATEWAY = $(ip route | grep default | awk '{print $3}')"
}

print_ramtotal1 () {
    echo "RAM_TOTAL = $(free -h | awk '/^Mem:/ {printf "%.3f GB\n", $2/1024}')"
}

print_ramused1 () {
    echo  "RAM_USED = $(free -h | awk '/^Mem:/ {printf "%.3f GB\n", $3/1024}')"
}

print_ramfree1 () {
    echo "RAM_FREE = $(free -h | awk '/Mem:/ {printf "%.3f GB\n", $4/1024}')"
}

print_spaceroot1 () {
    echo "SPACE_ROOT = $(df / | awk 'NR==2{printf "%.2f MB", $2/1024}')"
}

print_spacerootused1 () {
    echo "SPACE_ROOT_USED = $(df / | awk 'NR==2{printf "%.2f MB", $3/1024}')"
}
print_spacerootfree1 () {
    echo "SPACE_ROOT_FREE  = $(df / | awk 'NR==2{printf "%.2f MB", $4/1024}')"
}
print_hostname1
print_timezone1
print_name1
print_os1
print_date1
print_uptime1
print_uptimesec1
print_ip1
print_mask1
print_gateway1
print_ramtotal1
print_ramused1
print_ramfree1
print_spaceroot1
print_spacerootused1
print_spacerootfree1
