#!/bin/sh

mysqld --user=mysql --datadir=/var/lib/mysql &
sleep 5
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME ;" > db.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD' ;" >> db.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;" >> db.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD' ;" >> db.sql
echo "FLUSH PRIVILEGES;" >> db.sql
sleep 5
mariadb < db.sql
rm db.sql
