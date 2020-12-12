#! /bin/bash

mdkir mount-volume

docker network create multiple-services

docker run -d --rm \
    --name mongodb \
    --network multiple-services \
    -e MONGO_INITDB_ROOT_USERNAME=mongodb \
    -e MONGO_INITDB_ROOT_PASSWORD=root \
    -v /Users/nthung/Repos/docker-k8s-practical-guide/mount-volume/mongodb:/data/db \
    mongo

docker stop mongodb




docker build -t ms-backend:latest .

docker run \
    -d \
    --rm \
    -p 80:80 \
    --name ms-backend-app \
    -e MONGO_USERNAME=mongodb \
    -e MONGO_PASSWORD=root \
    --network multiple-services \
    -v ms-backend-log:/app/logs \
    -v /Users/nthung/Repos/docker-k8s-practical-guide/backend:/app \
    -v /app/node_modules \
    ms-backend:latest

docker rm ms-backend-app
docker logs -f ms-backend-app
docker stop ms-backend-app



docker build \
    -t ms-frontend:latest \
    --build-arg DEFAULT_BACK_END_PORT=80 \
    --build-arg DEFAULT_BACK_END_HOST=localhost .

docker run \
    -it \
    -d \
    --rm \
    -p 8080:3000 \
    --name ms-frontend-app \
    -e REACT_APP_BACK_END_HOST=localhost \
    -e REACT_APP_BACK_END_PORT=80 \
    -v /Users/nthung/Repos/docker-k8s-practical-guide/frontend:/app \
    -v /app/node_modules \
    ms-frontend:latest

docker rm ms-frontend-app
docker logs -f ms-frontend-app
docker start ms-frontend-app
docker stop ms-frontend-app
