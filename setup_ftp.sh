#!/usr/bin/env bash
#should open ports 22, 40000-50000 in the firewall

sudo apt update
sudo apt install vsftpd
sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.orig
user="rembown"
sudo adduser "$user"
sudo mkdir "/home/$user/ftp"
sudo chown nobody:nogroup "/home/$user/ftp"
sudo chmod a-w "/home/$user/ftp"
sudo mkdir "/home/$user/ftp/files"
sudo chown "$user:$user" "$HOME/ftp/files" #fix: need permission to actually upload
echo "write_enable=YES" | sudo tee -a /etc/vsftpd.conf
echo "chroot_local_user=YES" | sudo tee -a /etc/vsftpd.conf
echo "user_sub_token=$USER" | sudo tee -a /etc/vsftpd.conf
echo "local_root=/home/$USER/ftp" | sudo tee -a /etc/vsftpd.conf
echo "pasv_min_port=40000" | sudo tee -a /etc/vsftpd.conf
echo "pasv_max_port=50000" | sudo tee -a /etc/vsftpd.conf
echo "userlist_enable=YES" | sudo tee -a /etc/vsftpd.conf
echo "userlist_file=/etc/vsftpd.userlist" | sudo tee -a /etc/vsftpd.conf
echo "userlist_deny=NO" | sudo tee -a /etc/vsftpd.conf
echo "rembown" | sudo tee -a /etc/vsftpd.userlist
sudo systemctl restart vsftpd

