#!/bin/bash

sudo apt-get update
sudo apt-get install ca-certificates curl tmux ufw

# Add Docker's official GPG key:
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt upgrade -y
sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo systemctl enable docker
sudo usermod -aG docker ubuntu

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow OpenSSH
#sudo ufw allow 5432
#sudo ufw allow 8080
sudo ufw allow 80
sudo ufw allow 443
sudo ufw enable

sudo docker swarn init

sudo useradd deploy
sudo usermod -aG docker deploy
ssh-keygen -t ed25519 -C "deploy@piquel.fr"
echo "Please refer to README.md to setup deploy user"
