FROM php:7.4-fpm-alpine
RUN apk add --no-cache shadow
RUN docker-php-ext-install pdo pdo_mysql
RUN apk add

WORKDIR /var/www
RUN rm -rf /var/www/html

COPY . /var/www
RUN chown -R www-data:www-data /var/www

RUN ln -s public html

RUN usermod -u 1000 www-data
USER www-data

EXPOSE 9000

ENTRYPOINT ["php-fpm"]
