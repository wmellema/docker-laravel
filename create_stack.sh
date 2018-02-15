#!/bin/bash
root=$(pwd);

git clone https://github.com/laravel/laravel
wait
cd laravel;
wait
sed 's/DB_DATABASE=homestead/DB_DATABASE=default/g' .env.example > .envtmp1;
wait
sed 's/DB_USERNAME=homestead/DB_USERNAME=default/g' .envtmp1 > .env;
wait
rm -f .envtmp*;
wait
git clone https://github.com/Laradock/laradock.git;
wait
git pull;
wait
cd laradock;
wait
cp env-example .env;
wait
pwd;
wait
docker-compose up -d nginx mysql;
wait
mysql_host=$(cd $root/laravel/laradock; docker-compose exec mysql ip -4 addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
wait
sed -i 's/DB_HOST=127.0.0.1/DB_HOST='$mysql_host'/g' "$root/laravel/.env"
wait
cd "$root/laravel/laradock";
wait
docker-compose exec workspace composer install
wait
cd "$root/laravel/laradock";
wait
docker-compose exec workspace php artisan key:generate
wait
