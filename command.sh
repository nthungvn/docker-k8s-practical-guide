#!/bin/bash

docker-compose --build
docker-compose run --rm composer create-project --prefer-dist laravel/laravel .

# It will start the dependencies container
docker-compose up -d --build server

docker-compose run --rm artisan migrate
