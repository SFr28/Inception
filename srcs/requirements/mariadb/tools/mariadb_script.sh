#!/bin/bash

SQL_PASSWORD=$(cat "/run/secrets/mariadb_pw")
SQL_ROOT_PASSWORD=$(cat "/run/secrets/mariadb_root_pw")

set -e

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
chmod -R 755 /run/mysqld

chown -R mysql:mysql /var/lib/mysql
chmod -R 755 /var/lib/mysql

mysqld_safe --user=mysql --datadir=/var/lib/mysql --socket=/run/mysqld/mysqld.sock &

until [ -S /run/mysqld/mysqld.sock ]; do
    echo "Waiting for MariaDB to start..."
    sleep 1
done 

mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"
mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';" 
mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';" 
mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "ALTER USER root@localhost IDENTIFIED BY '${SQL_ROOT_PASSWORD}';" 
mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;" 

mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown

exec mysqld_safe