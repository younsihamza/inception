FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade  -y && apt-get install -y php7.4\
                                                            php-fpm\
                                                            php-mysql\
                                                            curl \
                                                            sendmail\
                                                            mariadb-client

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \ 
    && mv wp-cli.phar /usr/local/bin/wp
    && mkdir -p /var/www/wordpress
RUN sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = wordpress:9000|g' /etc/php/7.4/fpm/pool.d/www.conf

COPY tools/wordpress.sh wordpress.sh 
RUN mkdir -p /run/php && chmod +x wordpress.sh
CMD ["sh" ,"wordpress.sh"]