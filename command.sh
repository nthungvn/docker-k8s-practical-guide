#! /bin/bash

docker build -t feedback-node:volumes --build-arg DEFAULT_PORT=8083 .

docker run -d -p 8080:8083 --rm \
    --name feedback-app \
    -v feedback:/app/feedback \
    -v /Users/nthung/Repos/docker-k8s-practical-guide:/app:ro \
    -v /app/temp \
    -v /app/node_modules \
    feedback-node:volumes

docker stop feedback-app

docker volume ls
docker volume inspect feedback
