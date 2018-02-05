#!/bin/bash
echo "Script de Wordpress"
cd ~
yum install wget -y 
clear
wget http://wordpress.org/latest.tar.gz
tar -xf latest.tar.gz
cp -r wordpress/* /var/www/html/
mkdir /var/www/html/wp-content/uploads
chown -R apache:apache /var/www/html/*
cd /var/www/html
cp wp-config-sample.php wp-config.php
sed -i 's/database_name_here/wordb/g' wp-config.php
sed -i 's/username_here/root/g' wp-config.php
sed -i 's/password_here/root/g' wp-config.php
sed -i 's/localhost/db/g' wp-config.php
echo "Script Finalizado Correctamente"
exec /usr/sbin/apachectl -DFOREGROUND
