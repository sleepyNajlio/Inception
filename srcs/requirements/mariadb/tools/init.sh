#!/bin/bash

# Start the mariadb service
service mariadb start
sleep 2

# Set the root password

echo -e "\nn\nY\npass11\npass11\nY\nY\nY\nY\n" | mysql_secure_installation

# mysqladmin -u root password $ROOT_PASSWORD

# Create a new database
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mysql -u root -p$ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
# sleep 1
# Create a new user and grant privileges to the database
echo "CREATE USER IF NOT EXISTS '$DB_USER' IDENTIFIED BY '$DB_USER_PASSWORD';"
mysql -u root -p$ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD';"

echo "SHOW DATABASES;"
mysql -u root -p$ROOT_PASSWORD -e "SHOW DATABASES;"

echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
mysql -u root -p$ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
mysql -u root -p$ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
# Stop the mariadb service
service mariadb stop

# Start the mariadb service in foreground mode
mysqld --user=mysql --console