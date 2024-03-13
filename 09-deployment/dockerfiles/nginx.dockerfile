FROM nginx:stable-alpine

WORKDIR /etc/nginx/conf.d

COPY ./nginx/nginx.conf ./default.conf
COPY ./nginx/nthung.vlvn.cf/ .
