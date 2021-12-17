FROM php:8.1-cli

# Install global requirements
RUN \
    apt-get update && \
    apt-get install -y --no-install-recommends zip unzip git ssh-client wget

RUN docker-php-ext-install sockets

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

