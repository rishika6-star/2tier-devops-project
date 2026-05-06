#!/bin/bash

set -e

# CONFIG
DOCKER_USERNAME="RISHIKA2060"
BACKEND_IMAGE="backend-app"
FRONTEND_IMAGE="frontend-app"
TAG="latest"

echo "🔐 Logging into Docker Hub..."
docker login

echo "🐳 Building Backend Image..."
docker build -t $DOCKER_USERNAME/$BACKEND_IMAGE:$TAG ./application/backend

echo "🐳 Building Frontend Image..."
docker build -t $DOCKER_USERNAME/$FRONTEND_IMAGE:$TAG ./application/frontend

echo "📤 Pushing Backend Image..."
docker push $DOCKER_USERNAME/$BACKEND_IMAGE:$TAG

echo "📤 Pushing Frontend Image..."
docker push $DOCKER_USERNAME/$FRONTEND_IMAGE:$TAG

echo "✅ Build & Push Complete!"
