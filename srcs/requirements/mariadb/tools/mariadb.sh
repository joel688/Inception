#!/bin/sh

mariadbd --user=mysql &

sleep 1

mysql -e "CREATE DATABASE IF NOT EXISTS \`$SQL_DATABASE\`;"

mysql -e "CREATE USER IF NOT EXISTS \`$SQL_USER\`@'localhost' IDENTIFIED BY '$SQL_PASSWORD';"

mysql -e "GRANT ALL PRIVILEGES ON \`$SQL_DATABASE\`.* TO \`$SQL_USER\`@'%';"

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';"

mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

sleep 5

exec mysqld_safe
