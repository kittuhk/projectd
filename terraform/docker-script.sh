#!/bin/bash

set -e

echo "====== Updating system ======"
sudo apt update -y
sudo apt upgrade -y

echo "====== Installing Docker (docker.io) ======"
sudo apt install -y docker.io

echo "====== Enabling & starting Docker ======"
sudo systemctl enable docker
sudo systemctl start docker

echo "====== Adding current user to docker group ======"
# Automatically detects the current login user
CURRENT_USER=$(logname)
sudo usermod -aG docker $CURRENT_USER

echo "====== Fixing docker.sock permission issue ======"
# Sometimes docker.sock gets reset after reboot or install
sudo chmod 666 /var/run/docker.sock

echo "====== Restarting Docker ======"
sudo systemctl restart docker

echo "====== Docker Installation Completed Successfully ======"
echo "NOTE: You must log out and login again for group changes to apply."

