
# Basic setup
apt update
apt install snapd
snap install core
snap refresh core

# Intall nginx
apt install nginx-light
unlink /etc/nginx/sites-enabled/default
# Copy the proxy configuration to nginx
cp proxy.conf /etc/nginx/sites-available/
# Link to enabled configs
ln -s /etc/nginx/sites-available/proxy.conf /etc/nginx/sites-enabled/proxy.conf
# Test the nginx config
nginx -t
systemctl enable --now nginx

# Setup Certbot
# Remove if already existing
apt-get remove certbot
snap install --classic certbot
ln -s /snap/bin/certbot /usr/bin/certbot
certbot --nginx


# Install docker
apt install docker

# Get the rust bitwarden server
# FROM: https://github.com/dani-garcia/bitwarden_rs
docker pull bitwardenrs/server:latest
docker run -d --name bitwarden -v /bw-data/:/data/ -p 8081:80 bitwardenrs/server:latest