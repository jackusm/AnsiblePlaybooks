#!/usr/bin/env bash

title() {
    local color='\033[1;37m'
    local nc='\033[0m'
    printf "\n${color}$1${nc}\n"
}

title "Install Ansible"
os_string=`cat /etc/issue`

if [[ $os_string == *"Kali"* ]]; then
	echo "Detected Kali,  add ansible repository"
	sudo apt install software-properties-common -y
	sudo apt-add-repository ppa:ansible/ansible -y
fi

sudo apt update
sudo apt install curl ansible -y
