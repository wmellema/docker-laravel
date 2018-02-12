

all:
	docker run -d -p 9000:9000 --restart always -v /var/run/docker.sock:/var/run/docker.sock -v ~/portainer:/data portainer/portainer
	git clone https://github.com/laravel/laravel; \
	cd laravel; \
	git submodule add https://github.com/Laradock/laradock.git; \
	cd laradock; \
	sed 's/INSTALL_XDEBUG=false/INSTALL_XDEBUG=true/g' env-example > .env; \
	pwd; \
	docker-compose up -d nginx mysql;

	cd laravel/laradock; docker-compose exec workspace composer install
	cd laravel/laradock; docker-compose exec workspace cp .env.example .env
	cd laravel/laradock; docker-compose exec workspace php artisan key:generate
