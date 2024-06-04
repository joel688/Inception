#!/bin/sh

mysqld --user=mysql --datadir=/var/lib/mysql &
sleep 5
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE ;" > db.sql
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> db.sql
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' ;" >> db.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;" >> db.sql
echo "FLUSH PRIVILEGES;" >> db.sql
sleep 5
mariadb < db.sql
rm db.sql


