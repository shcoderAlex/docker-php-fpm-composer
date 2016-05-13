#Version: 0.0.1
FROM alpine:edge

MAINTAINER Alex Vikarchuk <shcoder.alex@gmail.com>

RUN apk update && \
  apk upgrade && \
  apk add --update \
    bash \
    git \
    curl \
    php-phar \
    php-common \
    php-iconv \
    php-mcrypt \
    php-pdo \
    php-ctype \
    php-openssl \
    php-pdo_mysql \ 
    php-mysqli \
    php-xml \
    php-dom \
    php-dev \
    php-soap \
    php-cli \
    php-json \
    php-mysql \
    php-curl \
    php-gd \
    php-fpm && \
  rm /var/cache/apk/*


RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer 


RUN sed -i 's|listen = 127.0.0.1:9000|listen = 9000|g' /etc/php/php-fpm.conf

EXPOSE 9000
ENTRYPOINT ["php-fpm","-F"]