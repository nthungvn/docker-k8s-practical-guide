#! /bin/bash

docker build -t feedback-node:volumes .

docker run -d -p 8080:8081 --rm \
    --name feedback-app \
    -v feedback:/app/feedback \
    -v /Users/nthung/Repos/docker-k8s-practical-guide:/app:ro \
    -v /app/temp \
    -v /app/node_modules \
    -e PORT=8081 \
    feedback-node:volumes

docker stop feedback-app

docker volume ls
docker volume inspect feedback
