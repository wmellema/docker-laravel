#!/bin/bash

echo "Configuring Laravel Environment...."
key=$(cat laravel/.env | awk '/base64:?+/ { print $1}' | awk '{split($0,a,"="); print a[2]}')
key="$key="
sed -i "s/'key' => env('APP_KEY'.*),/'key' => env('APP_KEY','$key'),/g" laravel/config/app.php
sed -i "s/'charset' => 'utf8mb4',/'charset' => 'utf8',/g" laravel/config/database.php
sed -i "s/'collation' => 'utf8mb4_unicode_ci',/'collation' => 'utf8_unicode_ci',/g" laravel/config/database.php

sudo chmod -R ugo+rwx laravel/storage laravel/bootstrap/cache
