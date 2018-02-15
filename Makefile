


portainer:
	docker run -d -p 9000:9000 --restart always -v /var/run/docker.sock:/var/run/docker.sock -v ~/portainer:/data portainer/portainer

docker:

laravel:
	git clone https://github.com/laravel/laravel
laradock: laravel

	cd laravel; \
	sed 's/DB_DATABASE=homestead/DB_DATABASE=default/g' .env.example > .envtmp1; \
	sed 's/DB_USERNAME=homestead/DB_USERNAME=default/g' .envtmp1 > .env; \
	rm -f .envtmp*; \
	git clone https://github.com/Laradock/laradock.git; \
	git pull; \
	cd laradock; \
	cp env-example .env; \
	pwd; \
	docker-compose up -d nginx mysql;

build-env: laradock
	 cd laravel/laradock; docker-compose exec mysql ip -4 addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'
	# sed -i 's/DB_HOST=127.0.0.1/DB_HOST=$(mysql_host)/g' laravel/.env

	cd laravel/laradock; docker-compose exec workspace composer install
	cd laravel/laradock; docker-compose exec workspace php artisan key:generate
all: build-env
