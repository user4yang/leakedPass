#!/bin/bash

# Installation
echo "Installing Python..."
pkg install -y python

echo "Installing Flask..."
pip install flask

echo "Installing Wget"
pip install wget

echo "Installing cloudflare"
wget https://github.com/cloudflare/cloudflared/releases/download/2024.2.1/cloudflared-linux-arm64

echo "Making cloudflared executable..."
chmod +x cloudflared-linux-arm64

# Start server
echo "Starting server..."
python app.py &

# Start Cloudflared tunnel
echo "Starting Cloudflared tunnel..."
./cloudflared-linux-arm64 tunnel --url 127.0.0.1:5000
