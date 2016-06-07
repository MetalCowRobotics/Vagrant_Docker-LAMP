FROM eboraas/laravel
MAINTAINER Krithik Rao <krdevmail@gmail.com>

RUN ["rm","-rf","/var/www/laravel"]

RUN /usr/local/bin/composer create-project laravel/lumen /var/www/lumen --prefer-dist
RUN /bin/chown www-data:www-data -R /var/www/lumen/storage /var/www/lumen/bootstrap/cache

EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
