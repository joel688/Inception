FROM	alpine:3.19

ARG	MYSQL_DATABASE
ARG	MYSQL_USER
ARG	MYSQL_PASSWORD
ARG	MYSQL_ROOT_PASSWORD

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

COPY	conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY	tools/launch.sh /launch.sh
RUN	chmod 777 launch.sh
RUN	./launch.sh
RUN	env >> toto

ENTRYPOINT	["mysqld",  "--user=mysql"]
