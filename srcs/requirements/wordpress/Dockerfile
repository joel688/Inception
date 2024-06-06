FROM	alpine:3.19

ARG	DB_HOST
ARG	DOMAIN_NAME
ARG	DB_NAME
ARG	DB_USER
ARG	DB_USER_PASSWORD
ARG	WP_ADMIN
ARG	WP_ADMIN_PASSWORD
ARG	WP_USER
ARG	WP_USER_PASSWORD

RUN	apk update && \
	apk upgrade && \
	apk add --no-cache \
	curl \
	wget \
	bash \
	mariadb-client \
	php81 \
	php81-fpm \
	php81-json \
	php81-zlib \
	php81-xml \
	php81-xmlwriter \
	php81-simplexml \
	php81-pdo \
	php81-phar \
	php81-openssl \
	php81-pdo_mysql \
	php81-mysqli \
	php81-session \
	php81-gd \
	php81-iconv \
	php81-gmp \
	php81-zip \
	php81-curl \
	php81-opcache \
	php81-ctype \
	php81-apcu \
	php81-intl \
	php81-bcmath \
	php81-dom \
	php81-mbstring \
	php81-xmlreader \
	php81-redis \
	php81-tokenizer

RUN	ln -s /usr/bin/php81 /usr/local/bin/php

COPY	./conf/wp-config.php /
COPY	./tools/setup.sh /
COPY	./tools/setup2.sh /
COPY	./conf/www.conf /etc/php81/php-fpm.d/
RUN	chmod +x setup.sh && ./setup.sh
RUN	chmod +x setup2.sh

RUN	mkdir -p /run/php

EXPOSE	9000

ENTRYPOINT	["/bin/sh", "/setup2.sh"]

