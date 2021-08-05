FROM php:7.4-fpm

WORKDIR /var/www/html

RUN apt-get update \
    && apt-get install --quiet --yes --no-install-recommends \
    && apt-get install -y git \
    libzip-dev \
    libicu-dev \
    unzip \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-install zip pdo pdo_mysql \
    && pecl install -o -f redis-6.2.4 \
    && docker-php-ext-enable redis
