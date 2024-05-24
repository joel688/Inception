FROM	alpine:3.19

RUN	apk update && \
	apk add --no-cache mariadb mariadb-client

COPY	./conf/my.cnf /etc/my.cnf

#Create necessary directory for Mariadb, chown change permissions
RUN	mkdir -p /run/mysql && \
	mkdir -p /var/lib/mysql && \
	chown -R mysql:mysql /run/mysql /var/lib/mysql

COPY	./tools/script.sh ./

RUN	chmod +x ./script.sh && \
	mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql && \
	./script.sh

EXPOSE	3306

CMD ["mysqld", "--user=mysql"]
