FROM php:8.1.12-fpm-alpine

# Add php.ini
COPY ./php/php.dev.ini /usr/local/etc/php/conf.d/40-custom.ini

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install dependencies
RUN apk add curl

# Install extensions
RUN curl -sSLf \
            -o /usr/local/bin/install-php-extensions \
            https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions
RUN chmod +x /usr/local/bin/install-php-extensions
RUN install-php-extensions \
            pdo \
            pdo_pgsql \
            xdebug

# Clear cache
RUN rm -rf /var/cache/apk/*

# Copy existing application directory contents
COPY ./www/ /var/www/

WORKDIR /var/www/

CMD ["php-fpm"]
