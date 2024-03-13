FROM nginx:stable-alpine

WORKDIR /etc/nginx/conf.d

COPY ./nginx/nginx.conf .

RUN mv nginx.conf default.conf

# COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf

WORKDIR /var/www/html

COPY ./src .
