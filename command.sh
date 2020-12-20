#! /bin/bash

docker build -t sunshineaact/k8s-first-app .
docker push sunshineaact/k8s-first-app
kubectl create deployment k8s-first-deployment --image=sunshineaact/k8s-first-app
kubectl get deployment

kubectl expose deployment k8s-first-deployment --type=LoadBalancer --port=8080

minikube service k8s-first-deployment

kubectl get service
kubectl get pods

kubectl scale deployment/k8s-first-deployment --replicas=3
kubectl get pods
kubectl scale deployment/k8s-first-deployment --replicas=1

# Update the deployment: Failed
docker build -t sunshineaact/k8s-first-app .
docker push sunshineaact/k8s-first-app
kubectl set image deployment/k8s-first-deployment k8s-first-app=sunshineaact/k8s-first-app
kubectl get deployment

# Update the deployment: OK
docker build -t sunshineaact/k8s-first-app:1 .
docker push sunshineaact/k8s-first-app:1
kubectl set image deployment/k8s-first-deployment k8s-first-app=sunshineaact/k8s-first-app:1

# Rollback
kubectl set image deployment/k8s-first-deployment k8s-first-app=sunshineaact/k8s-first-app:2
kubectl rollout undo deployment/k8s-first-deployment
kubectl get pods

kubectl rollout history deployment/k8s-first-deployment
kubectl rollout history deployment/k8s-first-deployment --revision=3
kubectl rollout undo deployment/k8s-first-deployment --to-revision=1



## Deployment Declarative
kubectl apply -f deployment.yaml

