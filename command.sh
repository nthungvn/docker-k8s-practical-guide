#!/bin/bash

#1
docker run -it node:14

#2
docker run -it -d --rm --name node-ultil node:14
docker exec -it node-ultil npm init
docker stop node-ultil

#3
docker run -it --rm --name node-ultil node:14 npm init
