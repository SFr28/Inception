FROM debian:bookworm

RUN apt-get update -y ; apt-get upgrade -y ; apt-get install wget -y \
    php8.2-fpm \
    php8.2-mysql \
    curl

RUN wget https://wordpress.org/wordpress-6.8.3.tar.gz -P /var/www && \
    cd /var/www && tar -xzf wordpress-6.8.3.tar.gz && \
    rm -rf wordpress-6.8.3.tar.gz

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp
    
COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

COPY ./tools/wp_script.sh /wp_script.sh
RUN chmod +x /wp_script.sh

ENTRYPOINT ["/wp_script.sh"]
