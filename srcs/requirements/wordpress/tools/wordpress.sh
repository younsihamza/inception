#!bin/sh
FILE_PATH=" /var/www/wordpress/wp-config.php"
echo $DB_HOST
echo $DATABASE_USER_NAME
echo $DATABASE_USER_PASSWORD
echo $DATABASE_NAME
# while ! mariadb -h${DB_HOST} -u${DATABASE_USER_NAME} -p${DATABASE_USER_PASSWORD} ${DATABASE_NAME} &>/dev/null; 
# do
# 	sleep 1
#     echo "Waiting for mariadb to start..."
# done
if [ ! -f "$FILE_PATH" ]; then
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
    chmod +x wp-cli.phar 
    mv wp-cli.phar /usr/local/bin/wp
    mkdir -p /var/www/wordpress

    # chown -R root:root /var/www/wordpress
    cd /var/www/wordpress/
    wp core download --allow-root --path='/var/www/wordpress'
    wp config create --dbname=$DATABASE_NAME --dbuser=$DATABASE_USER_NAME --dbpass=$DATABASE_USER_PASSWORD --dbhost=mariadb --path='/var/www/wordpress' --allow-root

    wp core install --url=$WP_URL --title="$WP_TITLE" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --path='/var/www/wordpress' --allow-root
    wp user create $NEW_USER_NAME $NEW_USER_EMAIL --role=$NEW_USER_ROLE --user_pass=$NEW_USER_PASSWORD --path='/var/www/wordpress' --allow-root
fi
/usr/sbin/php-fpm7.4 -F