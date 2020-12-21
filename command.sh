#! /bin/bash

docker-compose build

docker tag docker-k8s-practical-guide_tasks sunshineaact/k8s-networking-tasks
docker tag docker-k8s-practical-guide_users sunshineaact/k8s-networking-users
docker tag docker-k8s-practical-guide_auth sunshineaact/k8s-networking-auth

docker push sunshineaact/k8s-networking-tasks
docker push sunshineaact/k8s-networking-users
docker push sunshineaact/k8s-networking-auth
