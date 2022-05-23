Magento Community Edition
=========================
Prepare Docker images
---------------------
1. cd to nginx-php7.4-fpm
2. run command build image
```
cd nginx-php7.4-fpm
docker build -t jane3030/nginx-php7.4-fpm:1.0.0 .
```

Run magento-ce
--------------
```
docker-compose up -d
```

Access magento
--------------
[http://localhost:18080](http://localhost:18080)

Access magento backoffice
--------------
[http://localhost:18080/store_admin](http://localhost:18080/store_admin)

username: admin

password: admin123

