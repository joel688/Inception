FROM	alpine:3.19

RUN	apk upgrade && \
	apk update && \
	apk add\
	nginx \
	vim \
	curl

RUN	mkdir -p /etc/nginx/ssl && \
	mkdir -p /var/www/html

RUN	apk add --no-cache openssl

RUN	chmod 700 /etc/nginx/ssl

RUN	openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=PARIS/O=42/OU=42/CN=joakoeni.42.fr/UID=joakoeni" && \
	set +a

RUN	mkdir -p /var/run/nginx && \
	mkdir -p /var/www/html

COPY	conf/joakoeni.42.fr.conf /etc/nginx/nginx.conf

RUN	chmod 755 /var/www/html

RUN	if ! getent group www-data > /dev/null 2>&1; then addgroup -S www-data; fi && \
	if ! getent passwd www-data > /dev/null 2>&1; then adduser -S www-data -G www-data; fi


#RUN	addgroup -S www-data && \
#    	adduser -S -G www-data www-data

RUN	chown -R www-data:www-data /var/www/html

CMD	["nginx", "-g", "daemon off;"]
