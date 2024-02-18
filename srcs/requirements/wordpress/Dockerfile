FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade  -y && apt-get install -y php7.4\
                                                            php-fpm\
                                                            php-mysql\
                                                            curl \
                                                            sendmail\
                                                            mariadb-client
RUN sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = wordpress:9000|g' /etc/php/7.4/fpm/pool.d/www.conf
COPY tools/wordpress.sh wordpress.sh 
RUN mkdir -p /run/php && chmod +x wordpress.sh
CMD ["sh" ,"wordpress.sh"]