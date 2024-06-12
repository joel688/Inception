#!/bin/sh

until mysqladmin ping --user="${DB_USER}" --password="${DB_USER_PASSWORD}" --host="${DB_HOST}" 2>/dev/null
do
	echo "WAITING FOR MARIADB"
	sleep 5
done
echo "OK MARIADB"

if ! wp core is-installed --path=/var/www/html; then
    wp core install --url="${DOMAIN_NAME}" \
        --title='Inception' \
        --admin_user="${WP_ADMIN}" \
        --admin_password="${WP_ADMIN_PASSWORD}" \
        --admin_email='toto@gmail.com' \
        --path=/var/www/html --allow-root
    wp user create "${WP_USER}" 'wpuser@gmail.com' \
        --user_pass="${WP_USER_PASSWORD}" \
        --path=/var/www/html
fi

php-fpm81 -F
