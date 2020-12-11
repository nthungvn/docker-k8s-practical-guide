#!/bin/bash

docker network create feedback-network

docker build --tag feedback-node:network .

docker run -d --rm --name mongodb --network feedback-network mongo

docker run -d --rm -p 3000:3000 --name feedback-app --network feedback-network feedback-node:network

docker logs feedback-app
docker stop feedback-app
docker stop mongodb
