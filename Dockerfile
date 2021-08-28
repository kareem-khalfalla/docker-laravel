FROM php:8.0.9-fpm

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y \
    zip unzip git

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN install-php-extensions gd pdo_mysql bcmath zip intl opcache

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN groupadd --gid 1000 appuser \
    && useradd --uid 1000 -g appuser \
    -G www-data,root --shell /bin/bash \
    --create-home appuser

USER appuser

RUN echo 'alias pa="php artisan"' >> ~/.bashrc

RUN git config --global user.email "kareem.khalfalla.dev@gmail.com"
RUN git config --global user.name "Kareem"
