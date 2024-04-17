FROM debian:bullseye
RUN apt-get update && apt-get upgrade && \
    apt-get install -y nginx openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/raccoman.pem \
        -keyout /etc/nginx/ssl/raccoman.key\
        -subj "/C=Mo/ST=Bengurir/L=Bengurir/O=1337 School/OU=afanti/CN=afanti/"

# RUN mkdir -p /run/nginx
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf
CMD ["nginx", "-g", "daemon off;"]
