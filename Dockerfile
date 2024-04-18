from mysql
env MYSQL_ROOT_PASSWORD=root
env MYSQL_DATABASE=bitcoindb

copy . /docker-entrypoint-initdb.d
