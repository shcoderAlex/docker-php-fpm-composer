#Version: 0.0.1
FROM alpine:edge

MAINTAINER Alex Vikarchuk <shcoder.alex@gmail.com>

RUN apk update && \
  apk upgrade && \
  apk add --update \
    bash \
    git \
    curl \
    php5-phar \
    php5-common \
    php5-iconv \
    php5-mcrypt \
    php5-pdo \
    php5-ctype \
    php5-openssl \
    php5-pdo_mysql \ 
    php5-mysqli \
    php5-xml \
    php5-dom \
    php5-dev \
    php5-soap \
    php5-cli \
    php5-json \
    php5-mysql \
    php5-curl \
    php5-gd \
    php5-fpm && \
  rm /var/cache/apk/*


RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer 


RUN sed -i 's|listen = 127.0.0.1:9000|listen = 9000|g' /etc/php5/php-fpm.conf

EXPOSE 9000
ENTRYPOINT ["php-fpm","-F"]