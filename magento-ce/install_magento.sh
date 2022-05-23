#!/bin/bash

cd /var/www/html/

./bin/magento setup:install \
    --base-url=${BASE_URL} \
    --db-host=${DB_HOST} \
    --db-name=${DB_NAME} \
    --db-user=${DB_USERNAME} \
    --db-password=${DB_PASSWORD} \
    --db-prefix=mgt_ \
    --admin-firstname=${ADMIN_FIRSTNAME} \
    --admin-lastname=${ADMIN_LASTNAME} \
    --admin-email=${ADMIN_EMAIL} \
    --admin-user=${ADMIN_USERNAME} \
    --admin-password=${ADMIN_PASSWORD} \
    --elasticsearch-host=${ELASTIC_SEARCH_HOST} \
    --search-engine=elasticsearch7 \
    --elasticsearch-host=${ELASTIC_SEARCH_HOST} \
    --elasticsearch-port=${ELASTIC_SEARCH_PORT} \
    --use-rewrites=1 \
    --currency=THB \
    --language=th_TH \
    --timezone=Asia/Bangkok \
    --backend-frontname=store_admin \
    --session-save=redis --session-save-redis-host=redis --session-save-redis-persistent-id=magento_yala_numrung --session-save-redis-db=2 \
    --page-cache=redis --page-cache-redis-server=redis --page-cache-redis-db=3 \
    --cache-backend=redis --cache-backend-redis-server=redis --cache-backend-redis-db=4 \
    --key=b2bcaff5ba54bbdbd76d4556bc55441b

cd /var/www/html/
./bin/magento module:enable --all --clear-static-content
./bin/magento config:set system/backup/functionality_enabled 1
./bin/magento setup:di:compile
./bin/magento setup:static-content:deploy -f
./bin/magento cache:clean
./bin/magento cache:flush
./bin/magento setup:upgrade
./bin/magento indexer:reindex
./bin/magento module:disable Magento_TwoFactorAuth
./bin/magento setup:di:compile

rm -rf /home/app
sh /var/entrypoint.sh
