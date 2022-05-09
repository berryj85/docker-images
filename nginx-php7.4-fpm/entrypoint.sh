#!/bin/bash
sh /var/start_config_php.sh
service nginx start &&\
php-fpm7.3 -RF