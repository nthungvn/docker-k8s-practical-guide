#! /bin/bash

docker build -t sunshineaact/k8s-first-app .
docker push sunshineaact/k8s-first-app
kubectl create deployment k8s-first-deployment --image=sunshineaact/k8s-first-app
kubectl get deployment
