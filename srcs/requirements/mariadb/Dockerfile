FROM	alpine:3.19

EXPOSE	3306
ARG	DB_NAME
ARG	DB_USER
ARG	DB_USER_PASSWORD
ARG	DB_ROOT_PASSWORD

RUN	apk update && \
	apk upgrade && \
	apk add --no-cache mariadb mariadb-client bash

RUN	mkdir -p /var/run/mysqld && \
	mkdir -p /etc/mysql && \
	mkdir -p /var/lib/mysql && \
	chmod 777 /var/run/mysqld && \
	touch /var/run/mysqld/mysqld.sock && \
	chown -R mysql:mysql /var/run/mysqld && \
	chown -R mysql:mysql /etc/mysql/ && \
	chown -R mysql:mysql /var/lib/mysql && \
	mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

COPY	conf/50-server.cnf	/etc/mysql/my.cnf
COPY	tools/launch.sh .
RUN	chmod 777 launch.sh
RUN	./launch.sh

ENTRYPOINT	["mysqld",  "--user=mysql"]
