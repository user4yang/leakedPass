#!/bin/bash

# Installation
echo "Installing Python..."
pkg install -y python

echo "Installing Flask..."
pip install flask

echo "Making cloudflared executable..."
chmod +x cloudflared

# Start server
echo "Starting server..."
python app.py &

# Start Cloudflared tunnel
echo "Starting Cloudflared tunnel..."
./cloudflared tunnel --url 127.0.0.1:5000
