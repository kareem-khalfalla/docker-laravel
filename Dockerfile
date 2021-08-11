FROM php:7.4-fpm

WORKDIR /var/www/html

RUN apt-get update
RUN apt-get install zip unzip
RUN docker-php-ext-install pdo pdo_mysql

#     && apt-get install --quiet --yes --no-install-recommends \
#     && apt-get install -y git intl \
#     libzip-dev \
#     libicu-dev \
#      \
#     && docker-php-ext-configure intl \
#     && pecl install -o -f redis-6.2.4 \
#     && docker-php-ext-enable redis

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN groupadd --gid 1000 appuser \
    && useradd --uid 1000 -g appuser \
    -G www-data,root --shell /bin/bash \
    --create-home appuser

USER appuser