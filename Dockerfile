FROM 7.4-fpm-alpine3.15
RUN apk add --no-cache shadow

WORKDIR /var/www
RUN rm -rf /var/www/html

COPY . /var/www
RUN chown -R www-data:www-data /var/www

RUN ln -s public html

RUN usermod -u 1000 www-data
USER www-data

EXPOSE 9000

ENTRYPOINT ["php-fpm"]
