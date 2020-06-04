FROM ubuntu:18.04


COPY ./conf/application /etc/nginx/sites-enabled/application

RUN apt-get update && apt-get install -y ufw \
    nginx \
    software-properties-common
RUN add-apt-repository ppa:ondrej/php && apt-get update
RUN apt-get install -y php7.3-fpm \
    php7.3-common \
    php7.3-mysql \
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
    unzip
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN unlink /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Bangkok /etc/localtime
RUN ufw allow 'Nginx HTTP' && ufw allow 'Nginx HTTPS'
RUN rm -rf /etc/nginx/sites-enabled/default
RUN nginx -t && php-fpm7.3 -t
RUN echo "<?php phpinfo(); ?>" >> /var/www/html/info.php
CMD mkdir /run/php/ && php-fpm7.3 -R  &&\
    service nginx start &&\
    top -b
WORKDIR /var/www/html
EXPOSE 80
