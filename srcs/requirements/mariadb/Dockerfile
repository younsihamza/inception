FROM debian:bullseye
arg DATABASE_NAME
arg DATABASE_USER_NAME
arg DATABASE_USER_PASSWORD
arg DATABASE_ROOT_PASS
RUN apt-get update -y && apt-get  upgrade -y && apt-get install -y mariadb-server
RUN sed -i "s/# port = 3306/ port = 3306/" /etc/mysql/mariadb.cnf
RUN sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf
RUN echo "CREATE DATABASE IF NOT EXISTS ${DATABASE_NAME}; \
        CREATE USER IF NOT EXISTS '${DATABASE_USER_NAME}'@'%' IDENTIFIED BY '${DATABASE_USER_PASSWORD}'; \
        GRANT ALL PRIVILEGES ON ${DATABASE_NAME}.* TO '${DATABASE_USER_NAME}'@'%'; \
        FLUSH PRIVILEGES; \
        ALTER USER 'root'@'localhost' IDENTIFIED BY '${DATABASE_ROOT_PASS}';" > mysql.sql
RUN service mariadb start && mariadb < mysql.sql && rm -f mysql.sql
CMD ["mysqld"]