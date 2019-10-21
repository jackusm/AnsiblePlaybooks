#!/usr/bin/env bash
#should open ports 22, 40000-50000 in the firewall

sudo apt update
sudo apt install vsftpd
sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.orig
sudo adduser rembown
sudo mkdir "$HOME/ftp"
sudo chown nobody:nogroup "$HOME/ftp"
sudo chmod a-w "$HOME/ftp"
sudo mkdir "$HOME/ftp/files"
sudo chown "$user:$user" "$HOME/ftp/files"
echo "write_enable=YES" | sudo tee -a /etc/vsftpd.conf
echo "chroot_local_user=YES" | sudo tee -a /etc/vsftpd.conf
echo "user_sub_token=$USER" | sudo tee -a /etc/vsftpd.conf
echo "local_root=/home/$USER/ftp" | sudo tee -a /etc/vsftpd.conf
echo "pasv_min_port=40000" | sudo tee -a /etc/vsftpd.conf
echo "pasv_max_port=50000" | sudo tee -a /etc/vsftpd.conf
echo "userlist_enable=YES" | sudo tee -a /etc/vsftpd.conf
echo "userlist_file=/etc/vsftpd.userlist" | sudo tee -a /etc/vsftpd.conf
echo "userlist_deny=NO" | sudo tee -a /etc/vsftpd.conf
echo `whoami` | sudo tee -a /etc/vsftpd.userlist
sudo systemctl restart vsftpd

