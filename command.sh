#!/bin/bash

docker build --tag feedback-node:network .

docker run -d --rm -p 3000:3000 --name feedback-app feedback-node:network

docker run -d --rm --name mongodb mongo

docker logs feedback-app
docker stop feedback-app
docker stop mongodb
