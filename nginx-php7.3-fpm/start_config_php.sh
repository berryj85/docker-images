#!/bin/bash
if [ "$STORE_SESSION" = redis ] ; then
    sed -i -e "s/session\.save_handler\ =\ files/session\.save_handler\ =\ redis/g" /etc/php/7.3/fpm/php.ini
    sed -i -e "s/\;session\.save_path\ =\ \"\/var\/lib\/php\/sessions\"/session\.save_path\ =\ \"tcp:\/\/$REDIS_HOST\"/g" /etc/php/7.3/fpm/php.ini
    cat /etc/php/7.3/fpm/php.ini | grep session.save_handler
    cat /etc/php/7.3/fpm/php.ini | grep session.save_path
fi
sed -i -e "s/memory_limit\ =\ 128M/memory_limit\ =\ 2G/g" /etc/php/7.3/fpm/php.ini
sed -i -e "s/\;opcache\.enable=1/opcache\.enable=1/g" /etc/php/7.3/fpm/php.ini
sed -i -e "s/\;max_input_vars\ =\ 1000/max_input_vars\ =\ 10000/g" /etc/php/7.3/fpm/php.ini


