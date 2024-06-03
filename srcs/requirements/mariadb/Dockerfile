FROM	alpine:3.19

RUN	apk update && \
	apk upgrade && \
	apk add --no-cache mariadb mariadb-client bash

RUN	mkdir -p /var/run/mysqld && \
	mkdir -p /etc/mysql && \
	mkdir -p /var/lib/mysql && \
	chown -R mysql:mysql /var/run/mysqld && \
	chown -R mysql:mysql /etc/mysql/ && \
	chown -R mysql:mysql /var/lib/mysql

COPY	conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY	tools/launch.sh /launch.sh
RUN	chmod 777 launch.sh

ENTRYPOINT	["bash",  "/launch.sh"]
