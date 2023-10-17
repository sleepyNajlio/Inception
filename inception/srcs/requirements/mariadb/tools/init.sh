#!/bin/bash

# Start the mariadb service
service mariadb start
sleep 2


echo -e "\nn\nY\n$ROOT_PASSWORD\n$ROOT_PASSWORD\nY\nY\nY\nY\n" | mysql_secure_installation



mysql -u root -p$ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"


mysql -u root -p$ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD';"


mysql -u root -p$ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
mysql -u root -p$ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

service mariadb stop


mysqld --user=mysql --console
