#! /bin/bash

docker-compose build

docker tag docker-k8s-practical-guide_tasks sunshineaact/k8s-networking-tasks
docker tag docker-k8s-practical-guide_users sunshineaact/k8s-networking-users
docker tag docker-k8s-practical-guide_auth sunshineaact/k8s-networking-auth

docker push sunshineaact/k8s-networking-tasks
docker push sunshineaact/k8s-networking-users
docker push sunshineaact/k8s-networking-auth

kubectl apply \
  -f auth-deployment.yaml -f auth-service.yaml \
  -f users-deployment.yaml -f users-service.yaml \
  -f tasks-deployment.yaml -f tasks-service.yaml

minikube service users-service
minikube service tasks-service


docker tag docker-k8s-practical-guide_tasks-ui sunshineaact/k8s-networking-tasks-ui
docker push sunshineaact/k8s-networking-tasks-ui
