#! /bin/bash

docker build -t sunshineaact/k8s-third-app .
docker push sunshineaact/k8s-third-app

kubectl apply -f service.yaml -f deployment.yaml
