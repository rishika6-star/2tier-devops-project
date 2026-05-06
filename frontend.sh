#!/bin/bash

set -e

echo "🚀 Setting up Frontend..."

cd application

npx create-react-app frontend

cd frontend

echo "📦 Installing dependencies..."
npm install

echo "🏗️ Building frontend..."
npm run build

echo "✅ Frontend ready!"
