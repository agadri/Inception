#!/bin/bash

sed -ie 's/$DB_USER/'$DB_ADMIN'/' /var/www/wordpress/wp-config.php
sed -ie 's/$DB_NAME/'$DB_DATA_BASE_NAME'/' /var/www/wordpress/wp-config.php
sed -ie 's/$DB_PASSWORD/'$DB_ADMIN_PASSWORD'/' /var/www/wordpress/wp-config.php

if [ -f "/var/www/wordpress/conf" ];then
    echo ""
else
    cd /var/www/wordpress

	sleep 10;

    wp core --allow-root install --url="https://adegadri.42.fr/" --title="Inception Adegadri" --admin_name=$WP_ADMIN_USER --admin_email=$WP_ADMIN_EMAIL --admin_password=$WP_ADMIN_PASSWORD;

    wp --allow-root user create other other@gmail.com --user_pass=pass

    touch conf
fi

exec /usr/sbin/php-fpm7.3 -F -R