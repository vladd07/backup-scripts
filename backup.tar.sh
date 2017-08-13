#!/bin/bash
#Created 02-08-2017
#Version 1.0
#Author VD

#clear
#echo "etc/apache2 is starting to back up !"
#sleep 2

#rsync -ah --progress /etc/apache2/ /files/etc.apache && sleep 2
#echo "etc/Apache2     ------------>   D O N E !"
#echo "etc/letsencrypt/ is starting to back up !" &&
#sleep 2

#rsync -ah --progress /etc/letsencrypt/ /files/etc.letsencrypt && sleep 2
#echo "etc/letsencrypt ------------>   D O N E !"
#echo "etc/ssl is starting to back up !" &&
#sleep 2

#rsync -ah --progress /etc/ssl/ /files/etc.ssl && sleep 2
#echo "etc/ssl/        ------------>   D O N E !"
#echo "/var/www is starting to back up !" &&
#sleep 2

#rsync -ah --progress /var/www/ /files/var.www && sleep 2
#echo "/var/www/       ------------>   D O N E !"
#echo "etc/group is starting to back up !" &&
#sleep 2

rsync -ah --progress /etc/group /files/etc.group && sleep 2
echo "/etc/group      ------------>   D O N E !"
echo "etc/networks is starting to back up !" &&
sleep 2

rsync -ah --progress /etc/networks /files/etc.networks && sleep 2
echo "/etc/networks   ------------>   D O N E !"
echo "etc/passwd is starting to back up !" &&
sleep 2

rsync -ah --progress /etc/passwd /files/etc.passwd && sleep 2
echo "/etc/passwd     ------------>   D O N E !"
echo "etc/shadow is starting to back up !" &&
sleep 2

rsync -ah --progress /etc/shadow /files/etc.shadow && sleep 2
echo "/etc/shadow     ------------>   D O N E !" &&
echo "Updating the dpkg.list"
rm /files/dpkg.list
dpkg --get-selections > /files/dpkg.list &&


#Purpose = Backup of Important Data
#Created on 05-08-2017
#Author = VD
#Version 2.0
#START
# Tar credentials
DATE=`date +%d-%b-%Y`                  # This Command will add date in Backup File Name.

    # Make tarball
    cd /etc
    tar -cvpzf /files/etc.apache2/apache-$DATE.tar.gz apache2
    echo "apache 		--->> DONE !"
    tar -cvpzf /files/etc.letsencrypt/letsencrypt-$DATE.tar.gz letsencrypt
    echo "letsencrypt 		--->> DONE !"
    tar -cvpzf /files/etc.ssl/ssl-$DATE.tar.gz ssl 
    echo "ssl 			--->> DONE !"
    cd /var &&
    tar -cvpzf /files/var.www/var.www-$DATE.tar.gz www
    echo "var.www 		--->> DONE !"
    #END

echo ""
echo "checking disk-usage, wait a second" &&
sleep 2
df -h && du -hs /files/*
