FROM debian:11.8

RUN apt update && apt install nginx openssl -y 

RUN mkdir /etc/nginx/ssl

COPY ./conf/* /etc/nginx/ssl/



# COPY ./conf/* /etc/nginx/ssl/
# RUN bin/sh -c /bin/sh -c chmod 644 /etc/nginx/ssl/cent.pem

RUN echo -n "http { \n\
    server { \n\
    listen 443 ssl; \n\
    server_name hyounsi.42.fr; \n\
    root html; \n\
    ssl_certificate /etc/nginx/ssl/hyounsi.42.fd.pem; \n\
    ssl_certificate_key /etc/nginx/ssl/hyounsi.42.fd-key.pem; \n\
    location / { \n\
        \n\
    } \n\
} }\n\
events {}\n" > /etc/nginx/nginx.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]

