FROM	alpine:3.19

RUN	apk update && apk add --no-cache \
	php81 \
	php81-fpm \
	php81-mysqli \
	php81-json \
	php81-opcache \
	php81-phar \
	php81-mbstring \
	php81-xml \
	php81-curl \
	php81-dom \
	php81-session \
	curl \
	tar \
	less \
	bash \
	su-exec

RUN	mkdir -p /run/php-fpm /var/www

COPY	./conf/www.conf /etc/php81/php-fpm.d/www.conf

#Config PHP-FPM to use /run/php-fpm
RUN	sed -i 's|^listen = 127.0.0.1:9000|listen = /run/php-fpm/php-fpm.sock|' /etc/php81/php-fpm.d/www.conf

RUN	curl -o /tmp/wordpress.tar.gz -SL https://wordpress.org/latest.tar.gz && \
	tar -xzf /tmp/wordpress.tar.gz -C /var/www/ && \
	rm /tmp/wordpress.tar.gz && \
	chown -R nobody:nogroup /var/www/wordpress

EXPOSE 9000

CMD ["php-fpm81", "-F"]
