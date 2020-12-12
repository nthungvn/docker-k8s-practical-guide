#! /bin/bash

mdkir mount-volume

docker network create multiple-services

docker run -d --rm \
    --name mongodb \
    --network multiple-services \
    -v /Users/nthung/Repos/docker-k8s-practical-guide/mount-volume/mongodb:/data/db \
    mongo

docker stop mongodb
