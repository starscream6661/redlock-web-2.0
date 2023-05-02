FROM php:8.1-apache

RUN chown -R www-data:www-data /var/www/html/ \
    && chmod -R u=rw,g=rw,o= /var/www/html/

COPY ./WEB/ /var/www/html/

COPY redlock-db.sql /docker-entrypoint-initdb.d/redlock-db.sql

RUN apt-get update && apt-get install -y default-mysql-client

EXPOSE 7077

WORKDIR /var/www/html/

CMD ["apache2-foreground"]
