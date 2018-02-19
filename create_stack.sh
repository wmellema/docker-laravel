#!/bin/bash
root=$(pwd);

system=$(./version.sh)
case $1 in
  portainer)
    echo Creating Portainer
    docker volume create portainer_data
    docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
    ;;
  portainer-only)
    echo Only creating portainer
    docker volume create portainer_data
    docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
    exit 0
    ;;
  *)
    echo Not installing Portainer
    ;;
esac


git clone https://github.com/laravel/laravel;
wait;
cd "laravel";
wait;
sed 's/DB_DATABASE=homestead/DB_DATABASE=default/g' .env.example > .envtmp1;
wait;
sed 's/DB_USERNAME=homestead/DB_USERNAME=default/g' .envtmp1 > .envtmp2;
wait;
git clone https://github.com/Laradock/laradock.git;
wait;
git pull;
wait;
cd "laradock";
wait;
cp env-example .env;
wait;
pwd;
wait;
docker-compose up -d nginx mysql;
wait;
if [ $system = "Darwin" ];
 then
  mysql_host=$(cd "$root/laravel/laradock"; docker-compose exec mysql ip -4 addr show eth0 | awk '/inet /{print substr($2,0,length($2)-3)}')
else
  mysql_host=$(cd "$root/laravel/laradock"; docker-compose exec mysql ip -4 addr show eth0 | awk '/inet addr/{print substr($2,6)}')
fi
wait
cd "$root/laravel"
cat .envtmp2 | sed 's/DB_HOST=127.0.0.1/DB_HOST='$mysql_host'/g' > .env
wait
rm -f .envtmp*;
wait;
cd "$root/laravel/laradock";
wait
docker-compose exec workspace composer install
wait
cd "$root/laravel/laradock";
wait
docker-compose exec workspace php artisan key:generate
wait
