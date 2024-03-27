#!/bin/sh

# Wait for MariaDB
while ! mariadb -h "mariadb" -u"$SQL_USER" -p"$SQL_PASSWORD" ; do
    sleep 3
done

# Change directory to WordPress root
cd /var/www/wordpress

# Check if WordPress is not installed yet
if [ ! -f "wp-config.php" ]; then
# Download WordPress core files
    wp core download --allow-root

# Create wp-config.php
    wp config create --dbname="$SQL_DATABASE" --dbuser="$SQL_USER" --dbpass="$SQL_PASSWORD" --dbhost="mariadb" --dbcharset="utf8" --dbcollate="utf8_general_ci" --skip-check --allow-root

# Install WordPress
    wp core install --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$SQL_USER" --admin_password="$SQL_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" --allow-root

# Create additional user
    wp user create "$WP_USR" "$WP_EMAIL" --role=author --user_pass="$WP_PWD" --allow-root
fi

exec /usr/sbin/php-fpm7.4 -F
