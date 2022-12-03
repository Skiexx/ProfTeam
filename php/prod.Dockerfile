FROM php:8.1.12-fpm-alpine

# Copy existing application directory contents
COPY ./www/ /var/www/

# Add php.ini
COPY ./php/php.prod.ini /usr/local/etc/php/conf.d/40-custom.ini

# Install composer
ARG PHP_PROJECT_DIR
WORKDIR $PHP_PROJECT_DIR
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
ARG COMPOSER_ALLOW_SUPERUSER=1
RUN composer install

# Install dependencies
RUN apk add curl

# Install extensions
RUN curl -sSLf \
            -o /usr/local/bin/install-php-extensions \
            https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions \
RUN chmod +x /usr/local/bin/install-php-extensions]
RUN install-php-extensions \
            pdo \
            pdo_pgsql

# Clear cache
RUN rm -rf /var/cache/apk/*

CMD ["php-fpm"]
