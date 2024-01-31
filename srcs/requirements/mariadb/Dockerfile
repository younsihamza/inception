FROM debian:bullseye

ARG DATABASE_NAME
ARG DATABASE_USER_NAME
ARG DATABASE_USER_PASSWORD
ARG DATABASE_ROOT_PASSWORD

COPY ./tools/mariadb.sh .

RUN apt update && apt-get install mariadb-server mariadb-client -y


RUN chmod +x /mariadb.sh

RUN sh mariadb.sh 

ENTRYPOINT ["mysqld_safe"]