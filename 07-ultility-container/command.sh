#!/bin/bash

#1
docker run -it --rm node:14

#2
docker run -it -d --rm --name node-util node:14
docker exec -it node-util npm init
docker stop node-util

#3
docker run -it --rm --name node-util node:14 npm init

#--------------------------------------------

#4
docker build -t node-util:latest .
docker run -it -d --rm \
  -v /Users/nthung/Repos/docker-k8s-practical-guide:/app \
  -v /app/node_modules \
  --name node-util \
  node-util:latest

docker exec -it node-util npm init
docker exec -it node-util npm install -s express

docker stop node-util

#5
docker build -t mynpm:latest .
docker run -it --rm \
  -v /Users/nthung/Repos/docker-k8s-practical-guide:/app \
  -v /app/node_modules \
  --name mynpm \
  mynpm:latest init

docker run -it --rm \
  -v /Users/nthung/Repos/docker-k8s-practical-guide:/app \
  -v /app/node_modules \
  --name mynpm \
  mynpm:latest install -s express

#6
docker-compose run --rm npm install -D nodemon

docker-compose up --build -d
docker-compose exec mynpm npm install body-parser
docker-compose down
