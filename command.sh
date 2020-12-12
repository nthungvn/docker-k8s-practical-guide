#! /bin/bash

mdkir mount-volume

docker network create multiple-services

docker run -d --rm \
    --name mongodb \
    --network multiple-services \
    -v /Users/nthung/Repos/docker-k8s-practical-guide/mount-volume/mongodb:/data/db \
    mongo

docker stop mongodb


docker build -t ms-backend:latest .

docker run -d --rm \
    -p 80:80 \
    --name ms-backend-app \
    --network multiple-services \
    -v ms-backend-log:/app/logs \
    ms-backend:latest

docker rm ms-backend-app
docker logs ms-backend-app
docker stop ms-backend-app

docker build -t ms-frontend:latest --build-arg DEFAULT_BACK_END_PORT=80 .

docker run \
    -p 8080:3000 \
    --name ms-frontend-app \
    --network multiple-services \
    -e BACK_END_PORT=80 \
    -v /Users/nthung/Repos/docker-k8s-practical-guide/frontend:/app \
    -v /app/node_modules \
    ms-frontend:latest

docker rm ms-frontend-app
docker logs ms-frontend-app
docker start ms-frontend-app
docker stop ms-frontend-app
