FROM ubuntu:18.04

ENV STORE_SESSION=file
ENV REDIS_HOST=localhost
ENV DEBIAN_FRONTEND=noninteractive
COPY ./conf/application /etc/nginx/sites-enabled/application

RUN apt-get update && apt-get install -y ufw nginx unzip git curl software-properties-common
RUN add-apt-repository ppa:ondrej/php && apt-get update
RUN apt-get install -y php7.4-fpm \
    php7.4-common \
    php7.4-mysql \
    php7.4-bcmath \
    php7.4-xml \
    php7.4-xmlrpc \
    php7.4-curl \
    php7.4-gd \
    php7.4-cli \
    php7.4-imap \
    php7.4-mbstring \
    php7.4-opcache \
    php7.4-soap \
    php7.4-zip \
    php7.4-mysqlnd \
    php7.4-opcache \
    php7.4-pdo \
    php7.4-calendar \
    php7.4-ctype \
    php7.4-dom \
    php7.4-exif \
    php7.4-fileinfo \
    php7.4-ftp \
    php7.4-gettext \
    php7.4-iconv \
    php7.4-json \
    php7.4-mysqli \
    php7.4-phar \
    php7.4-posix \
    php7.4-readline \
    php7.4-shmop \
    php7.4-simplexml \
    php7.4-sockets \
    php7.4-sysvmsg \
    php7.4-sysvsem \
    php7.4-sysvshm \
    php7.4-tokenizer \
    php7.4-xmlreader \
    php7.4-xmlwriter \
    php7.4-xsl \
    php7.4-intl \
    php7.4-redis 
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN unlink /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Bangkok /etc/localtime &&\
    echo "Asia/Bangkok" >  /etc/timezone

RUN ufw allow 'Nginx HTTP' && ufw allow 'Nginx HTTPS'
RUN rm -rf /etc/nginx/sites-enabled/default
RUN nginx -t && php-fpm7.4 -t
RUN mkdir /run/php/
RUN echo "<?php phpinfo(); ?>" >> /var/www/html/info.php
COPY ./entrypoint.sh /var/entrypoint.sh
COPY ./start_config_php.sh /var/start_config_php.sh
ENTRYPOINT [ "sh","/var/entrypoint.sh" ]
WORKDIR /var/www/html
EXPOSE 80