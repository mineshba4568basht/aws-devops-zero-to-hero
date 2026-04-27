#!/bin/bash
# install_dependencies.sh
# This script is used by AWS CodeDeploy to install application dependencies
# It runs during the Install lifecycle event

set -e

echo "Starting dependency installation..."

# Update package manager
apt-get update -y

# Install Python3 and pip if not already installed
if ! command -v python3 &> /dev/null; then
    echo "Installing Python3..."
    apt-get install -y python3
fi

if ! command -v pip3 &> /dev/null; then
    echo "Installing pip3..."
    apt-get install -y python3-pip
fi

# Navigate to the application directory
cd /home/ubuntu/simple-python-app

# Install Python dependencies from requirements.txt if it exists
if [ -f "requirements.txt" ]; then
    echo "Installing Python dependencies from requirements.txt..."
    pip3 install -r requirements.txt
else
    echo "No requirements.txt found, installing Flask manually..."
    pip3 install flask
fi

echo "Dependency installation completed successfully."
