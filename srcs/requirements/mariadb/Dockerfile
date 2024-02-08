FROM debian:bullseye

RUN apt-get update -y && apt-get  upgrade -y && apt-get install -y mariadb-server
COPY conf/mysql.sql mysql.sql
RUN sed -i "s/# port = 3306/ port = 3306/" /etc/mysql/mariadb.cnf
RUN sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf
RUN service mariadb start   &&  mariadb < mysql.sql && rm -f mysql.sql
CMD ["mysqld"]