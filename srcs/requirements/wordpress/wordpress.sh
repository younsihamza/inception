#!/bin/bash


DB_NAME='your_database_name'
DB_USER='your_database_user'
DB_PASS='your_database_password'
DB_HOST='localhost'
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar 
mv wp-cli.phar /usr/local/bin/wp
wp core download
wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS
while ! wp db check; do
    echo "Waiting for database to be ready..."
    sleep 5
done
wp core install --url=$WP_URL --title="$WP_TITLE" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL
wp user create $NEW_USER_NAME $NEW_USER_EMAIL --role=$NEW_USER_ROLE --user_pass=$NEW_USER_PASSWORD