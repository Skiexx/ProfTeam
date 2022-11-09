FROM nginx:1.23.2-alpine

# Copy nginx config
COPY ./core/nginx.example.conf /etc/nginx/templates/default.conf.template

COPY . /var/www/