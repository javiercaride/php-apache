FROM php:8.1-apache
LABEL maintainer="hola@javiercaride.dev"
ENV REFRESHED_AT 2022-08-14

# Setting non interactive method to avoid error
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libzip-dev \
        libtidy-dev \
        libxslt-dev \
        librabbitmq-dev \
        libicu-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \    
    && docker-php-ext-configure tidy \
    && docker-php-ext-install -j$(nproc) tidy \
    && docker-php-ext-configure xsl \
    && docker-php-ext-install -j$(nproc) xsl \
    && docker-php-ext-configure zip \
    && docker-php-ext-install -j$(nproc) zip \
    && docker-php-ext-configure bcmath \
    && docker-php-ext-install -j$(nproc) bcmath \
    && docker-php-ext-configure pdo_mysql \
    && docker-php-ext-install -j$(nproc) pdo_mysql \
    && docker-php-ext-configure mysqli \
    && docker-php-ext-install -j$(nproc) mysqli \
    && docker-php-ext-configure intl \
    && docker-php-ext-install -j$(nproc) intl

RUN pecl install redis \
    && pecl install amqp \
    && pecl install mongodb \
    && docker-php-ext-enable redis amqp mongodb

RUN a2enmod rewrite && a2enmod actions

USER www-data