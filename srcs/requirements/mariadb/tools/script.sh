#!bin/sh

# sed -i "s/# port = 3306/ port = 3306/" /etc/mysql/mariadb.cnf
# sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf
# service mariadb start

# # mysqladmin -u root password "1234"
# mariadb -e "CREATE DATABASE wordpress;"
# mariadb -e "CREATE USER 'wordpress'@'%' IDENTIFIED BY 'wordpress';"
# mariadb -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'%';"
# mariadb -e "FLUSH PRIVILEGES;"

# service mariadb stop

# exec "$@"

sed -i "s/# port = 3306/port = 3306/" /etc/mysql/mariadb.cnf
sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf
service mariadb start &&
        mariadb  < mysql.sql &&
        rm -f mysql.sql
service mariadb stop
exec "$@"
