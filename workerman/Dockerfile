FROM php:8.1-cli

# Install global requirements
RUN \
    apt-get update && \
    apt-get install -y --no-install-recommends zip unzip git ssh-client wget

RUN set -ex \
    && pecl update-channels \
    && pecl install redis-stable xdebug \
    && docker-php-ext-enable redis \
    && docker-php-ext-install pdo_mysql pcntl sockets \
    && docker-php-ext-enable xdebug

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

