#!/bin/bash

docker-compose --build
docker-compose run --rm composer create-project --prefer-dist laravel/laravel .
