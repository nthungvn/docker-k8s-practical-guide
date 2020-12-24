#! /bin/bash

docker-compose build

docker tag docker-k8s-practical-guide_users sunshineaact/kub-dep-users:latest
docker push sunshineaact/kub-dep-users:latest

docker tag docker-k8s-practical-guide_auth sunshineaact/kub-dep-auth:latest
docker push sunshineaact/kub-dep-auth:latest

kubectl apply -f auth.yaml -f users.yaml
