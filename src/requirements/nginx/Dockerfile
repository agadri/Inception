FROM debian:buster

RUN apt-get update -yq
RUN apt-get install nginx -y
RUN apt-get install openssl -y
RUN rm etc/nginx/sites-enabled/default

EXPOSE 443
WORKDIR /etc/nginx/
RUN openssl req -x509 -newkey rsa:2048 -nodes -keyout adegadri.42.fr.key -out adegadri.42.fr.crt -days 365 \
	-subj "/C=FR/ST=France/L=Paris/O=42, Inc./OU=IT/CN=adegadri.42.fr"
WORKDIR /

COPY /nginx.conf /etc/nginx/sites-available/default
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/ && rm -rf /var/www/html

VOLUME "/var/www/wordpress"

ENTRYPOINT nginx -g 'daemon off;'