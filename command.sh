#! /bin/bash

docker build -t feedback-node:volumes .

docker run -d -p 80:80 --rm \
    --name feedback-app \
    -v feedback:/app/feedback \
    -v /Users/nthung/Repos/docker-k8s-practical-guide:/app \
    -v /app/temp feedback-node:volumes

docker stop feedback-app
