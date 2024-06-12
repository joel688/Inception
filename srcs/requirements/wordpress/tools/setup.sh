mkdir -p /var/www/html
cd /var/www/html
mv /wp-config.php .

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

chmod +x wp-cli.phar 

mv wp-cli.phar /usr/local/bin/wp

ln -s /usr/bin/php81 /usr/bin/php
adduser -D -H -u 82 -s /sbin/nologin www-data -G www-data

wp core download --allow-root
#sed -i s/TEMP_DB_NAME/$DB_NAME/ wp-config.php
#sed -i s/TEMP_DB_USER_PASSWORD/${DB_USER_PASSWORD}/ wp-config.php
#sed -i s/TEMP_DB_USER/$DB_USER/ wp-config.php
#sed -i s/TEMP_DB_HOST/$DB_HOST/ wp-config.php
#sed -i "s#TEMP_DB_NAME#${DB_NAME}#" wp-config.php
sed -i "s#TEMP_DB_USER_PASSWORD#${DB_USER_PASSWORD}#" wp-config.php
sed -i "s#TEMP_DB_USER#${DB_USER}#" wp-config.php
sed -i "s#TEMP_DB_HOST#${DB_HOST}#" wp-config.php
