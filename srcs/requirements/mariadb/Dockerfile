FROM debian:bookworm

WORKDIR /mariadb

RUN apt -y update && apt -y upgrade ; apt-get -y install mariadb-server

COPY conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf 

COPY ./tools/mariadb_script.sh /mariadb_script.sh
RUN chmod +x /mariadb_script.sh

ENTRYPOINT ["/mariadb_script.sh"]