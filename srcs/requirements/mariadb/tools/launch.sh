#!/bin/sh

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
	echo "/var/lib/mysql/$MYSQL_DATABASE directory exists";
	echo "***************************************************"
else
	echo "£££££££££££££££££££££££££££££££££££££££££££££££££"
  	echo "/var/lib/mysql/$MYSQL_DATABASE directory doesn't exist";
	mysql_install_db --user=mysql --datadir=/var/lib/mysql
  	sleep 5
  	mysqld --user=mysql --datadir=/var/lib/mysql &
  	sleep 10
  	mysql -uroot -e "\
  	CREATE USER IF NOT EXISTS root@localhost IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';\
  	SET PASSWORD FOR root@localhost = PASSWORD('$MYSQL_ROOT_PASSWORD');\
  	GRANT ALL ON *.* TO root@localhost WITH GRANT OPTION;\
  	CREATE USER IF NOT EXISTS root@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';\
  	SET PASSWORD FOR root@'%' = PASSWORD('$MYSQL_ROOT_PASSWORD');\
  	GRANT ALL ON *.* TO root@'%' WITH GRANT OPTION;\
  	CREATE USER IF NOT EXISTS $MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_PASSWORD';\
  	SET PASSWORD FOR $MYSQL_USER@'%' = PASSWORD('$MYSQL_PASSWORD');\
  	CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;\
  	GRANT ALL ON $MYSQL_DATABASE.* TO $MYSQL_USER@'%';\
  	FLUSH PRIVILEGES;\
  	SHUTDOWN;"
  	sleep 5
fi

echo "running mysqld -uroot"
exec mysqld -uroot
