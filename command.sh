#!/bin/bash

docker build --tag feedback-node:network .

docker run -d --rm -p 80:3000 --name feedback-app feedback-node:network

docker logs feedback-app
docker stop feedback-app
