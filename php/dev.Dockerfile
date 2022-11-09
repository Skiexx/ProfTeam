FROM php:8.1.12-fpm-alpine

# Add php.ini
COPY ./php.ini /usr/local/etc/php/conf.d/40-custom.ini

# Install dependencies
RUN apk add curl

# Install extensions
RUN curl -sSLf \
            -o /usr/local/bin/install-php-extensions \
            https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions
RUN chmod +x /usr/local/bin/install-php-extensions
RUN install-php-extensions \
            gd \
            pdo_mysql \
            xdebug

# Clear cache
RUN rm -rf /var/cache/apk/*

# Set working directory
WORKDIR /var/www/dev
COPY ./src .