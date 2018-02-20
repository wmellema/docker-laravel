#!/bin/bash
cd laravel/laradock
docker-compose exec --user=laradock workspace php artisan $@
