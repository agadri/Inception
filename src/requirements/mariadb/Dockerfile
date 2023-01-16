FROM debian:buster

RUN apt-get update -yq
RUN apt-get upgrade -y
RUN apt-get install -y mariadb-server

EXPOSE 3306

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./ /var/www/
COPY ./conf/mysql_secure /var/www/

RUN chmod +x ./var/www/mysql_secure && bash ./var/www/mysql_secure
RUN service mysql start

COPY tools/entrypoint.sh /entrypoint.sh

VOLUME  "/var/lib/mysql"

ENTRYPOINT  [ "sh", "entrypoint.sh"]