#!/bin/bash
if [ "$STORE_SESSION" = redis ] ; then
    sed -i -e "s/session\.save_handler\ =\ files/session\.save_handler\ =\ redis/g" /etc/php/7.4/fpm/php.ini
    sed -i -e "s/\;session\.save_path\ =\ \"\/var\/lib\/php\/sessions\"/session\.save_path\ =\ \"tcp:\/\/\\$REDIS_HOST\"/g" /etc/php/7.4/fpm/php.ini
    
    cat /etc/php/7.4/fpm/php.ini | grep session.save_handler
    cat /etc/php/7.4/fpm/php.ini | grep session.save_path
fi