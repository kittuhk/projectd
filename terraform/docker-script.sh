#!/bin/bash

sudo apt update
sudo apt upgrade -y

sudo apt install openjdk-21-jdk -y

sudo apt-get update
sudo apt-get install -y ca-certificates curl

sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt upgrade -y

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo usermod -aG docker ubuntu

# ---- FIXED LAST 4 LINES ----
sudo tee /etc/sudoers.d/ubuntu_nopasswd >/dev/null <<'EOT'
ubuntu ALL=(ALL) NOPASSWD:ALL
EOT

sudo chmod 440 /etc/sudoers.d/ubuntu_nopasswd
# -----------------------------------

