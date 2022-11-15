FROM nginx:1.23.2-alpine

# Copy nginx config
COPY ./nginx/core/nginx.prod.conf /etc/nginx/conf.d/default.conf

ARG NGINX_SERVER
ARG PHP_PROJECT_DIR
RUN sed -i 's#{{ NGINX_SERVER }}#'$NGINX_SERVER'#g' /etc/nginx/conf.d/default.conf
RUN sed -i 's#{{ PHP_PROJECT_DIR }}#'$PHP_PROJECT_DIR'#g' /etc/nginx/conf.d/default.conf

COPY ./www /var/www/