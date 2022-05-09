#!/bin/bash
cd /var/www/html && bin/magento setup:install \
    --base-url=${BASE_URL} \
        --db-host=${DB_HOST} \
        --db-name=${DB_NAME} \
        --db-user=${DB_USERNAME} \
        --db-password=${DB_PASSWORD} \
        --db-prefix=ylmr_ \
        --admin-firstname=${ADMIN_FIRSTNAME} \
        --admin-lastname=${ADMIN_LASTNAME} \
        --admin-email=${ADMIN_EMAIL} \
        --admin-user=${ADMIN_USERNAME} \
        --admin-password=${ADMIN_PASSWORD} \
        --use-rewrites=1 \
        --currency=THB \
        --language=th_TH \
        --timezone=Asia/Bangkok\
        --backend-frontname=${BACKEND_URL} \
        --session-save=redis --session-save-redis-host=redis --session-save-redis-persistent-id=magento --session-save-redis-db=2 \
        --page-cache=redis --page-cache-redis-server=redis --page-cache-redis-db=3 \
        --cache-backend=redis --cache-backend-redis-server=redis --cache-backend-redis-db=4 \
        --key=b2bcaff5ba54bbdbd76d4556bc55441b
bin/magento setup:di:compile
bin/magento setup:static-content:deploy -f
composer require mageplaza/magento-2-thai-language-pack:dev-master
bin/magento setup:static-content:deploy th_TH
bin/magento indexer:reindex
bin/magento cache:clean
bin/magento cache:flush