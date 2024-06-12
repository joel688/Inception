#!/bin/sh

mysqld --user=mysql --datadir=/var/lib/mysql &

sleep 10

if ! pgrep mysqld > /dev/null; then
	echo "MySQL server failed to start"
	exit 1
fi

{
	echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" > db.sql
	echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD';" >> db.sql
	echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';" >> db.sql
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';" >> db.sql
	echo "FLUSH PRIVILEGES;" >> db.sql
}

sleep 5

mariadb < db.sql

if [ $? -ne 0 ]; then
  echo "Failed to execute SQL script"
  exit 1
fi

rm db.sql

echo "Mariadb setup2.sh completed successfully"
