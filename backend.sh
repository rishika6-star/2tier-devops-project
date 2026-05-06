#!/bin/bash

# Exit on error
set -e

echo "🚀 Starting Backend Setup..."

# Update system
echo "📦 Updating packages..."
sudo apt update -y

# Install Node.js (LTS)
echo "⬇️ Installing Node.js..."
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

# Verify installation
node -v
npm -v

# Install PM2 (process manager)
echo "⚙️ Installing PM2..."
sudo npm install -g pm2

# Navigate to backend folder
echo "📁 Moving to backend directory..."
cd application/backend || exit

# Install dependencies
echo "📦 Installing backend dependencies..."
npm install

# Start backend using PM2
echo "🚀 Starting backend server..."
pm2 start server.js --name backend-app

# Save PM2 process
pm2 save
pm2 startup

echo "✅ Backend setup complete!"



SERVER.JS-----------
const express = require('express');
const app = express();

const PORT = 5000;

app.use(express.json());

app.get('/', (req, res) => {
    res.send('Backend is running 🚀');
});

app.get('/api', (req, res) => {
    res.json({ message: "Hello from backend!" });
});

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});



PACKAGE.JSON-------------
{
  "name": "backend-app",
  "version": "1.0.0",
  "main": "server.js",
  "scripts": {
    "start": "node server.js"
  },
  "dependencies": {
    "express": "^4.18.2"
  }
}
