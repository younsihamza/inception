#!bin/sh
until mysqladmin ping -h"$DB_HOST" -P"$DB_PORT" -u"$DATABASE_USER_NAME" -p"$DATABASE_USER_PASSWORD" --silent; do
    echo 'waiting for mariadb to be connectable...'
    sleep 2
done
if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
    mkdir -p /var/www/wordpress
    cd /var/www/wordpress/
    wp core download --allow-root --path='/var/www/wordpress'
    wp config create --dbname=$DATABASE_NAME --dbuser=$DATABASE_USER_NAME --dbpass=$DATABASE_USER_PASSWORD --dbhost=mariadb --path='/var/www/wordpress' --allow-root
    wp core install --url=$WP_URL --title="$WP_TITLE" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --path='/var/www/wordpress' --allow-root
    wp user create $NEW_USER_NAME $NEW_USER_EMAIL --role=$NEW_USER_ROLE --user_pass=$NEW_USER_PASSWORD --path='/var/www/wordpress' --allow-root
else
    echo "Wordpress is already installed"
fi
/usr/sbin/php-fpm7.4 -F