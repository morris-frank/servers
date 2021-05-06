#!/bin/bash
apt update
apt install rclone tar

# Install docker
apt install apt-transport-https ca-certificates curl gnupg lsb-release
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
apt update
apt install docker-ce docker-ce-cli containerd.io
apt install docker-compose

echo "Please setup Backblaze rclone now: (name B2)"
rclone config

./restore.sh
cp proxy.conf ~/appdata/swag/nginx/proxy-confs/