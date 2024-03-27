FROM debian:bullseye

RUN apt-get update && \
	apt-get upgrade -y  && \
	apt-get install -y wget
RUN apt-get install -y php7.3 \
	php-fpm \
	php-mysql \
	mariadb-client

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN cp wp-cli.phar /usr/bin/wp

RUN mkdir -p /run/php/
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress
COPY ./tools /var/www/

RUN echo "listen = wordpress:9000" >> /etc/php/7.4/fpm/php-fpm.conf
RUN chmod +x /var/www/configure.sh
CMD ["sh", "/var/www/configure.sh"]
