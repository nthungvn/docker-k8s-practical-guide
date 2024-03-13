#! /bin/bash

docker-compose build

docker tag docker-k8s-practical-guide_users sunshineaact/kub-dep-users:latest
docker push sunshineaact/kub-dep-users:latest

docker tag docker-k8s-practical-guide_auth sunshineaact/kub-dep-auth:latest
docker push sunshineaact/kub-dep-auth:latest

docker tag docker-k8s-practical-guide_tasks sunshineaact/kub-dep-tasks:latest
docker push sunshineaact/kub-dep-tasks:latest

kubectl apply -f mongo.yaml
kubectl apply -f users-pv.yaml
kubectl apply -f auth.yaml -f users.yaml -f tasks.yaml
