#!/bin/bash

apt update -y
apt install -y docker.io

systemctl start docker
systemctl enable docker

usermod -aG docker ubuntu

docker pull ${docker_username}/backend-app:latest

docker run -d -p 5000:5000 --name backend ${docker_username}/backend-app:latest
