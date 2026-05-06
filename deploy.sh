#!/bin/bash

set -e

DOCKER_USERNAME="RISHIKA2060"

echo "📥 Pulling latest images..."
docker pull $DOCKER_USERNAME/backend-app:latest
docker pull $DOCKER_USERNAME/frontend-app:latest

echo "🛑 Stopping old containers..."
docker stop backend || true
docker stop frontend || true

docker rm backend || true
docker rm frontend || true

echo "🚀 Starting Backend..."
docker run -d \
  --name backend \
  -p 5000:5000 \
  $DOCKER_USERNAME/backend-app:latest

echo "🚀 Starting Frontend..."
docker run -d \
  --name frontend \
  -p 80:80 \
  $DOCKER_USERNAME/frontend-app:latest

echo "✅ Deployment Complete!"
