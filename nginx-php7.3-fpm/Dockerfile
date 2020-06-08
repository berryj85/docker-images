FROM ubuntu:18.04

ENV STORE_SESSION=file
ENV REDIS_HOST=localhost
ENV DEBIAN_FRONTEND=noninteractive
COPY ./conf/application /etc/nginx/sites-enabled/application

RUN apt-get update && apt-get install -y ufw nginx unzip git curl software-properties-common
RUN add-apt-repository ppa:ondrej/php && apt-get update
RUN apt-get install -y php7.3-fpm \
    php7.3-common \
    php7.3-mysql \
    php7.3-bcmath \
    php7.3-xml \
    php7.3-xmlrpc \
    php7.3-curl \
    php7.3-gd \
    php7.3-cli \
    php7.3-imap \
    php7.3-mbstring \
    php7.3-opcache \
    php7.3-soap \
    php7.3-zip \
    php7.3-mysqlnd \
    php7.3-opcache \
    php7.3-pdo \
    php7.3-calendar \
    php7.3-ctype \
    php7.3-dom \
    php7.3-exif \
    php7.3-fileinfo \
    php7.3-ftp \
    php7.3-gettext \
    php7.3-iconv \
    php7.3-json \
    php7.3-mysqli \
    php7.3-phar \
    php7.3-posix \
    php7.3-readline \
    php7.3-shmop \
    php7.3-simplexml \
    php7.3-sockets \
    php7.3-sysvmsg \
    php7.3-sysvsem \
    php7.3-sysvshm \
    php7.3-tokenizer \
    php7.3-wddx \
    php7.3-xmlreader \
    php7.3-xmlwriter \
    php7.3-xsl \
    php7.3-intl \
    php7.3-redis 
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN unlink /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Bangkok /etc/localtime &&\
    echo "Asia/Bangkok" >  /etc/timezone

RUN ufw allow 'Nginx HTTP' && ufw allow 'Nginx HTTPS'
RUN rm -rf /etc/nginx/sites-enabled/default
RUN nginx -t && php-fpm7.3 -t
RUN mkdir /run/php/
RUN echo "<?php phpinfo(); ?>" >> /var/www/html/info.php
COPY ./entrypoint.sh /var/entrypoint.sh
COPY ./start_config_php.sh /var/start_config_php.sh
ENTRYPOINT [ "sh","/var/entrypoint.sh" ]
WORKDIR /var/www/html
EXPOSE 80