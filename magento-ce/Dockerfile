# FROM registry.gitlab.com/sourceberry-work/docker-images/nginx-php-fpm-dev
FROM nginx-php7.4-fpm

ENV BASE_URL=http://localhost
ENV DB_HOST=localhost:3306
ENV DB_NAME=ecommerce
ENV DB_USERNAME=ecommerce
ENV DB_PASSWORD=password
ENV ADMIN_FIRSTNAME=ecommerce-admin
ENV ADMIN_LASTNAME=admin
ENV ADMIN_EMAIL=admin@admin.com
ENV ADMIN_USERNAME=admin
ENV ADMIN_PASSWORD=admin123
ENV ADMIN_REWRITE=1
ENV BACKEND_URL=/store-admin
ENV STORE_SESSION=file
ENV REDIS_HOST=localhost

RUN curl -sS https://getcomposer.org/installer -o composer-setup.php &&\
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer

RUN  rm -f /var/www/html/*.* &&\
    composer create-project --repository-url=https://476cc07146b9b7e6ccc3d763029df441:eac67aa6cb92ab2a43da6c94b315b514@repo.magento.com/ magento/project-community-edition /var/www/html
RUN cd /var/www/html &&\
    find var generated vendor pub/static pub/media app/etc -type f -exec chmod g+w {} + &&\
    find var generated vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} +
RUN chown -R :www-data /var/www/html &&\
    chmod u+x bin/magento
COPY ./conf/application /etc/nginx/sites-enabled/application
COPY ./install_magento.sh /var/install_magento.sh
CMD [ "sh","/var/install_magento.sh" ]
WORKDIR /var/www/html
EXPOSE 80
