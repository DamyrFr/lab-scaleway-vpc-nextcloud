#!/bin/bash

apt update
apt -y upgrade
apt -y install vim curl mysql-client apache2 libapache2-mod-php php php-cli php-{curl,gd,intl,memcache,xml,zip,mbstring,json} bzip2 wget php-mysql
wget https://download.nextcloud.com/server/releases/nextcloud-23.0.2.tar.bz2
tar -xjf nextcloud-23.0.2.tar.bz2 -C /var/www/html/
mv /var/www/html/nextcloud/* /var/www/html/
chown -R www-data:www-data /var/www/html/
systemctl restart apache2
