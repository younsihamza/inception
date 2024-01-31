#!/bin/bash


sed -i 's/^bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
 echo "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME; \n \
    CREATE USER  IF NOT EXISTS '$DATABASE_USER_NAME'@'%' IDENTIFIED BY '$DATABASE_USER_PASSWORD';\n \
    GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$DATABASE_USER_NAME'@'%'; \n \
    ALTER USER 'root'@'localhost' IDENTIFIED BY '$DATABASE_ROOT_PASSWORD'; \n  \
     "  > init.sql
mysqld_safe &

while ! echo 'SELECT 1' | mysql --silent; do
  echo -n "."; sleep 1
done

mysql   < init.sql 
