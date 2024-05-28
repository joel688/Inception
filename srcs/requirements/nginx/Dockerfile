FROM	alpine:3.19

RUN	apk update && \
	apk upgrade && \
	apk add --no-cache nginx && \
	apk add --no-cache openssl bash

RUN	mkdir -p /etc/nginx/ssl

RUN	apk add --no-cache openssl

RUN	openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=joakoeni.42.fr/UID=joakoeni" && \
	set +a

RUN	mkdir -p /var/run/nginx && \
	mkdir -p /var/www/html

COPY 	conf/nginx.conf /etc/nginx/nginx.conf

RUN	chmod 755 /var/www/html

RUN	if ! getent group www-data > /dev/null 2>&1; then addgroup -S www-data; fi && \
	if ! getent passwd www-data > /dev/null 2>&1; then adduser -S www-data -G www-data; fi

RUN	chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]

