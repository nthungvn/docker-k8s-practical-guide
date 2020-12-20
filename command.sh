#! /bin/bash

docker build -t sunshineaact/k8s-third-app .
docker push sunshineaact/k8s-third-app

kubectl apply -f service.yaml -f deployment.yaml

# Create a emptyDir volume
kubectl apply -f deployment.yaml
minikube service k8s-third-service

# Create PersistentVolume
kubectl apply -f host-pv.yaml
