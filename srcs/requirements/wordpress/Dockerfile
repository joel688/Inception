FROM	alpine:3.19

RUN	apk update && \
	apk upgrade && \
	apk add \
	curl \
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

RUN	ln -s /usr/bin/php81 /usr/bin/php

RUN	mkdir -p /run/php-fpm /var/www

RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
    	mv wp-cli.phar /usr/local/bin/wp

COPY 	conf/php-fpm.conf /etc/php81/php-fpm.conf
COPY 	conf/www.conf /etc/php81/php-fpm.d/www.conf

RUN 	wget -qO /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x /usr/local/bin/wp

COPY 	conf/auto_config.sh /usr/local/bin/auto_config.sh
RUN 	chmod +x /usr/local/bin/auto_config.sh

RUN 	mkdir -p /run/php

ENV PATH="/usr/bin/php81:/usr/sbin:$PATH"

RUN	adduser --disabled-password --gecos '' nginx

CMD	["/bin/sh", "/usr/local/bin/auto_config.sh"]
