#!/usr/bin/env bash

title() {
    local color='\033[1;37m'
    local nc='\033[0m'
    printf "\n${color}$1${nc}\n"
}

title "Install zsh"
sudo ansible-galaxy install viasite-ansible.zsh --force
sudo ansible-playbook -i "localhost," -c local ./zsh.yml
sudo ansible-playbook -i "localhost," -c local ./zsh.yml --extra-vars="zsh_user=$(whoami)"

title "Install basic utilities"
sudo ansible-playbook -i "localhost," -c local ./basics.yml

title "Install vscode"
sudo ansible-galaxy install gantsign.visual-studio-code --force
sudo ansible-playbook -i "localhost," -c local ./vscode.yml

title "Install metasploit"
sudo ansible-playbook -i "localhost," -c local ./metasploit.yml

title "Install vim"
sudo ansible-galaxy install franklinkim.vim --force
sudo ansible-playbook -i "localhost," -c local ./vim.yml

title "Install pwndbg"
sudo ansible-playbook -i "localhost," -c local ./pwndbg.yml




