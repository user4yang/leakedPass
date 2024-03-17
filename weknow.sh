#!/bin/bash

# Function to install Python
install_python() {
    echo "Installing Python..."
    if [ "$(uname)" == "Darwin" ]; then
        # macOS platform
        echo "You are using macOS. Please install Python manually."
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        # Linux platform
        if [ -x "$(command -v apt)" ]; then
            # Kali Linux or similar with apt package manager
            sudo apt update
            sudo apt install -y python3 python3-pip
        elif [ -x "$(command -v pkg)" ]; then
            # Termux on Android
            pkg update
            pkg install -y python python-dev clang
            pip install --upgrade pip
        else
            echo "Unsupported Linux distribution. Please install Python manually."
        fi
    else
        echo "Unsupported platform. Please install Python manually."
    fi
}

# Function to install wget
install_wget() {
    echo "Installing wget..."
    if [ "$(uname)" == "Darwin" ]; then
        # macOS platform
        echo "You are using macOS. Please install wget manually."
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        # Linux platform
        if [ -x "$(command -v apt)" ]; then
            # Kali Linux or similar with apt package manager
            sudo apt update
            sudo apt install -y wget
        elif [ -x "$(command -v pkg)" ]; then
            # Termux on Android
            pkg update
            pkg install -y wget
        else
            echo "Unsupported Linux distribution. Please install wget manually."
        fi
    else
        echo "Unsupported platform. Please install wget manually."
    fi
}

# Function to install git
install_git() {
    echo "Installing git..."
    if [ "$(uname)" == "Darwin" ]; then
        # macOS platform
        echo "You are using macOS. Please install git manually."
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        # Linux platform
        if [ -x "$(command -v apt)" ]; then
            # Kali Linux or similar with apt package manager
            sudo apt update
            sudo apt install -y git
        elif [ -x "$(command -v pkg)" ]; then
            # Termux on Android
            pkg update
            pkg install -y git
        else
            echo "Unsupported Linux distribution. Please install git manually."
        fi
    else
        echo "Unsupported platform. Please install git manually."
    fi
}

# Install necessary packages
install_python
install_wget
install_git

# Continue with Cloudflared and Python application setup...
