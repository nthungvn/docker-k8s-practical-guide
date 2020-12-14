#! /bin/bash

#Local machine
docker login

docker-compose build

docker tag docker-k8s-practical-guide_nginx:latest sunshineaact/nginx:latest
docker tag docker-k8s-practical-guide_webapp:latest sunshineaact/webapp:latest

docker push sunshineaact/nginx:latest
docker push sunshineaact/webapp:latest

#Remote machine
ssh -i "aws-ec2-key.pem" ec2-user@ec2-18-217-179-157.us-east-2.compute.amazonaws.com

sudo docker pull sunshineaact/nginx:latest
sudo docker pull sunshineaact/webapp:latest

sudo docker rmi sunshineaact/nginx:latest
sudo docker rmi sunshineaact/webapp:latest

sudo docker network create webapp-net

sudo docker run \
  -d --rm \
  --name nginx \
  -p 80:80 \
  sunshineaact/nginx:latest

sudo docker run \
  -d --rm \
  --name webapp \
  -p 8080:8080 \
  sunshineaact/webapp:latest

sudo docker logs -f nginx
sudo docker stop nginx webapp

sudo docker image prune -a
sudo docker ps -a
sudo docker exec -it nginx /bin/sh
