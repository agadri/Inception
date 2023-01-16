FROM debian:buster

RUN apt-get update -yq
RUN apt install php-fpm -yq
RUN apt-get -y install php-cli php-mysql php-curl php-gd php-intl

EXPOSE 9000
WORKDIR /var/www/

RUN apt-get update -yq  
RUN apt-get install wget -yq
RUN apt-get -y install php7.3 php-mysqli php-fpm 
RUN wget https://wordpress.org/wordpress-5.9.3.tar.gz
RUN tar -xzvf wordpress-5.9.3.tar.gz
RUN rm wordpress-5.9.3.tar.gz
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

WORKDIR /

COPY ./www.conf /etc/php/7.3/fpm/pool.d

COPY ./wp-config.php /var/www/wordpress/
COPY ./entrypoint.sh /var/www/
COPY ./ /var/www/wordpress/

RUN chmod 777 /var/www/wordpress/wp-config.php
RUN chmod +x /var/www/entrypoint.sh

RUN chown -R www-data:www-data /var/www/wordpress/
RUN service php7.3-fpm start
RUN service php7.3-fpm stop 

ENTRYPOINT [ "/var/www/entrypoint.sh" ]