#!/bin/bash

# Install Python
echo "Installing Python..."
sudo apt update
sudo apt install -y python3 python3-pip

# Install Cloudflared
echo "Installing Cloudflared..."
wget -q https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.deb
sudo dpkg -i cloudflared-stable-linux-amd64.deb

# Run Python application
echo "Running Python application..."
python3 app.py &

# Set up Cloudflared to tunnel traffic to localhost:5000
echo "Setting up Cloudflared tunnel..."
sudo cloudflared tunnel --url localhost:5000
