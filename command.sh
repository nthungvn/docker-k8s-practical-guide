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

sudo docker rmi sunshineaact/nginx:latest
sudo docker pull sunshineaact/nginx:latest

sudo docker rmi sunshineaact/webapp:latest
sudo docker pull sunshineaact/webapp:latest


sudo docker network create webapp-net

sudo docker run \
  -d --rm \
  --name nginx \
  -p 80:80 \
  -p 443:443 \
  --network webapp-net \
  sunshineaact/nginx:latest

sudo docker run \
  -d --rm \
  --name webapp \
  --network webapp-net \
  sunshineaact/webapp:latest

sudo docker run \
  -d --rm \
  --name jenkins \
  --network webapp-net \
  -v /home/ec2-user/jenkins_home:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  docker-k8s-rize_jenkins:latest

sudo docker run \
  -d \
  --rm \
  --name mysql \
  --network webapp-net \
  -v mksmart-db:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=change-pass-here \
  -e MYSQL_DATABASE=mksmart-db \
  mysql:5.7

sudo docker run \
  -d \
  --rm \
  --name mksmart \
  --network webapp-net \
  -e DATABASE_NAME=mksmart-db \
  -e DATABASE_USERNAME=root \
  -e DATABASE_PASSWORD=change-pass-here \
  -e DATABASE_HOST=mysql \
  -e FORCE_CREATE_DATABASE=true \
  mksmart-web:latest

sudo docker logs -f nginx
sudo docker stop nginx webapp jenkins mysql mksmart

sudo docker image prune -a
sudo docker ps -a
