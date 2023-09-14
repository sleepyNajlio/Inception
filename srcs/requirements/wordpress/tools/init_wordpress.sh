#!/bin/bash
if [ ! -f /var/www/html/wp-config.php ]; then
    cd /var/www/html

    wp core download --allow-root;
    cp /tmp/wp-config.php /var/www/html/

    # sleep 10
    # wp config create  --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_USER_PASSWORD --dbhost=$DB_HOST --allow-root

    wp core install --url='https://nloutfi.42.fr' --title="My WordPress Site" --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root

    wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root

fi

exec php-fpm7.4 -F