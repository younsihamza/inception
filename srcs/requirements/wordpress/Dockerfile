FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade  -y && apt-get install -y php7.4\
                                                            php-fpm\
                                                            php-mysql\
                                                            curl \
                                                            sendmail\
                                                            mariadb-client

COPY tools/wordpress.sh wordpress.sh 
COPY tools/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /run/php && chmod +x wordpress.sh

CMD ["sh" ,"wordpress.sh"]