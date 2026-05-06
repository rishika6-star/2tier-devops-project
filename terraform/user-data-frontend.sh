#!/bin/bash

apt update -y
apt install -y docker.io

systemctl start docker
systemctl enable docker

usermod -aG docker ubuntu

docker pull ${docker_username}/frontend-app:latest

docker run -d -p 80:80 --name frontend ${docker_username}/frontend-app:latest
