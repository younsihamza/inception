FROM debian

RUN apt update && apt install mariadb-server -y && apt-get -y install systemctl

RUN systemctl start mysql  && \
    mysql -e "UPDATE mysql.user SET Password=PASSWORD('your_new_password') WHERE User='root';" && \
    mysql -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');" && \
    mysql -e "DELETE FROM mysql.user WHERE User='';" && \
    mysql -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';" && \
    mysql -e "FLUSH PRIVILEGES;"

CMD ["mysqld"]