#!/bin/bash
cd /var/www/html && bin/magento setup:install \
    --base-url=${BASE_URL} \
    --db-host=${DB_HOST} \
    --db-name=${DB_NAME} \
    --db-user=${DB_USERNAME} \
    --db-password=${DB_PASSWORD} \
    --admin-firstname=${ADMIN_FIRSTNAME} \
    --admin-lastname=${ADMIN_LASTNAME} \
    --admin-email=${ADMIN_EMAIL} \
    --admin-user=${ADMIN_USERNAME} \
    --admin-password=${ADMIN_PASSWORD} \
    --use-rewrites=1 \
    --backend-frontname=${BACKEND_URL}
bin/magento setup:di:compile
bin/magento setup:static-content:deploy -f
composer require mageplaza/magento-2-thai-language-pack:dev-master
bin/magento setup:static-content:deploy th_TH
bin/magento indexer:reindex
bin/magento cache:clean
bin/magento cache:flush