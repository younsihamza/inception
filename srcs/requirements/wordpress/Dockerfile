FROM debian

RUN apt update && apt install curl -y 

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp 


RUN wp core download --path=wpdemo.test --locale=it_IT

RUN wp core install --url=hyounsi.42.fr --title="hyounsi" --admin_user=hyounsi --admin_password=password --admin_email=hamzayounsi006@gmail.com




