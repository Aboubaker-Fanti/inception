FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx

RUN mkdir -p /var/www/wordpress

COPY ./tools/fanti /var/www/wordpress
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]
