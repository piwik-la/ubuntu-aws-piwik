#!/bin/bash

#https://github.com/piwikla/debian7-nginx

#Add Piwik package repository
echo "deb http://debian.piwik.org/ piwik main" >> /etc/apt/sources.list.d/piwik.list
echo "deb-src http://debian.piwik.org/ piwik main" >> /etc/apt/sources.list.d/piwik.list
wget -qO - http://debian.piwik.org/repository.gpg | sudo apt-key add -

#Update
sudo apt-get update

#Install Nginx
sudo apt-get install nginx

#Install PHP 
sudo apt-get install php5-fpm php5-mysql

#Install MySQL
sudo apt-get install mysql-server
sudo mysql_install_db
sudo mysql_secure_installation

#Install Piwik
sudo apt-get install piwik
chown -R www-data:www-data /usr/share/piwik
chmod -R 0755 /usr/share/piwik

#Install phpMyAdmin
apt-get install phpmyadmin
sudo ln -s /usr/share/phpmyadmin/ /usr/share/piwik/dba

#Install PECL
sudo apt-get install php5-geoip php5-dev libgeoip-dev
sudo pecl install geoip

#Restart Service
sudo service php5-fpm restart
sudo service nginx restart
sudo service mysql restart
