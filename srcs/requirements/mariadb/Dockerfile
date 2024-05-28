FROM	alpine:3.19

RUN	apk update && \
	apk upgrade && \
	apk add --no-cache mariadb mariadb-client bash

RUN	mkdir -p /var/run/mysqld && \
	chmod 777 /var/run/mysqld && \
	chown -R mysql:mysql /var/run/mysqld && \
	touch /var/run/mysqld/mysqld.sock && \
	mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

COPY	/tools/mariadb.sh /usr/local/bin/setup_db.sh

RUN	chmod +x /usr/local/bin/setup_db.sh

COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

CMD	["/usr/local/bin/setup_db.sh"]
