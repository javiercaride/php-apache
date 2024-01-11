FROM php:8.2-apache
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libzip-dev \
        libtidy-dev \
        libxslt-dev \
        librabbitmq-dev \
        libicu-dev

RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

RUN docker-php-ext-configure tidy \
    && docker-php-ext-install -j$(nproc) tidy

RUN docker-php-ext-configure xsl \
    && docker-php-ext-install -j$(nproc) xsl

RUN docker-php-ext-configure zip \
    && docker-php-ext-install -j$(nproc) zip

RUN docker-php-ext-configure bcmath \
    && docker-php-ext-install -j$(nproc) bcmath

RUN docker-php-ext-configure pdo_mysql \
    && docker-php-ext-install -j$(nproc) pdo_mysql

RUN docker-php-ext-configure mysqli \
    && docker-php-ext-install -j$(nproc) mysqli

RUN docker-php-ext-configure intl \
    && docker-php-ext-install -j$(nproc) intl

RUN docker-php-ext-configure xml \
    && docker-php-ext-install -j$(nproc) xml


RUN pecl install redis
RUN pecl install amqp
RUN pecl install mongodb
RUN pecl install pcov

RUN docker-php-ext-enable redis amqp mongodb

RUN a2enmod rewrite && a2enmod actions

USER www-data