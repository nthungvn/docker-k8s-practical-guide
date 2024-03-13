#! /bin/bash

docker build -t sunshineaact/k8s-third-app .
docker push sunshineaact/k8s-third-app

kubectl apply -f service.yaml -f deployment.yaml

# Create a emptyDir volume
kubectl apply -f deployment.yaml
minikube service k8s-third-service

# Create PersistentVolume
kubectl apply -f host-pv.yaml
kubectl apply -f host-pvc.yaml
kubectl apply -f deployment.yaml

# ENV

docker build -t sunshineaact/k8s-third-app .
docker tag sunshineaact/k8s-third-app sunshineaact/k8s-third-app:3
docker push sunshineaact/k8s-third-app:3
kubectl apply -f deployment.yaml

# ENV: config map
kubectl apply -f environment.yaml
kubectl apply -f deployment.yaml
