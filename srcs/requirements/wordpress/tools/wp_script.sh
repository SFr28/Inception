#!/bin/bash

SQL_PASSWORD=$(cat "/run/secrets/mariadb_pw")
ADMIN_PASSWORD=$(cat "/run/secrets/wp_admin_pw")
USER_PASSWORD=$(cat "/run/secrets/wp_user_pw")

sleep 10

if [ ! -e "/var/www/wordpress/wp-config.php" ]; then
    
    wp config create            \
    --allow-root                \
    --path=/var/www/wordpress   \
    --dbname="${SQL_DATABASE}"   \
    --dbuser="${SQL_USER}"       \
    --dbpass="${SQL_PASSWORD}"   \
    --dbhost="mariadb:3306"

    wp core install                 \
    --allow-root                    \
    --path=/var/www/wordpress       \
    --url="${DOMAIN_NAME}"          \
    --title="Inception"             \
    --admin_user="${ADMIN_NAME}"    \
    --admin_password="${ADMIN_PASSWORD}" \
    --admin_email="saina@42.fr"  \
    --skip-email

    wp user create                  \
    "${USER_NAME}"                  \
    "${USER_EMAIL}"                 \
    --path=/var/www/wordpress       \
    --role=author                   \
    --porcelain                     \
    --allow-root                    \
    --user_pass="${USER_PASSWORD}"

    wp theme install breevia    \
    --activate                  \
    --path=/var/www/wordpress   \
    --allow-root

fi

exec /usr/sbin/php-fpm8.2 -F