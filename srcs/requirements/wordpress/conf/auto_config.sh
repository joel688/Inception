#!/bin/bash

sleep 10

if ! wp core is-installed --path=/var/www/html; then

	if [ ! -f /var/www/html/wp-config.php ]; then
		wp config create --allow-root \
			--dbname=$SQL_DATABASE \
	    		--dbuser=$SQL_USER \
	    		--dbpass=$SQL_PASSWORD \
	    		--dbhost=mariadb:3306 \
			--path='/var/www/html/'

    		wp core install --allow-root \
        		--url=$WORDPRESS_URL \
        		--title=$WORDPRESS_TITLE \
        		--admin_user=$WORDPRESS_ADMIN_USER \
        		--admin_password=$WORDPRESS_ADMIN_PASSWORD \
        		--admin_email=$WORDPRESS_ADMIN_EMAIL \
        		--skip-email
	fi
fi

php-fpm81 -F
