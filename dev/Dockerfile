FROM javiercaride/php:8.1-apache

LABEL maintainer="hola@javiercaride.dev"
ENV REFRESHED_AT 2022-08-14

# Setting non interactive method to avoid error
ENV DEBIAN_FRONTEND noninteractive

RUN pecl install xdebug && \
    docker-php-ext-enable xdebug

COPY xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini