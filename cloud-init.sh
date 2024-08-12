#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y docker.io azure-cli
sudo systemctl start docker
sudo systemctl enable docker
admin_username="<admin_username>"
sudo usermod -aG docker $admin_username
echo "Please log out and log back in to apply the Docker group changes."

