FROM alpine:3.14

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
        wget \
        php7 \
        php7-fpm \
        php7-mysqli \
        mariadb-client \
        curl \
	bash

COPY conf/php.ini /etc/php7/cli/php.ini

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

RUN sed -i "s|listen = /run/php/php7.3-fpm.sock|listen = 9000|g" /etc/php7/php-fpm.d/www.conf

COPY tools/autoconf.sh /autoconf.sh

RUN mkdir -p /run/php

ENTRYPOINT ["bash", "autoconf.sh"]

