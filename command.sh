#! /bin/bash

#Local machine
docker build -t sunshineaact/example-deployment-1 .
docker login
docker push sunshineaact/example-deployment-1

#Remote machine
sudo docker pull sunshineaact/example-deployment-1
sudo docker run \
  -d --rm \
  --name example-deployment-1 \
  -p 80:80 \
  sunshineaact/example-deployment-1

sudo docker logs -f example-deployment-1

