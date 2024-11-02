#!/bin/sh

bash -c "$(curl -fsSL https://get.hy2.sh/)"
cd /etc/hysteria
cp -f ~/.dot-files/deploy/hysteria-server.yaml config.yaml
read -p "Hysteria port: " port
read -p "Hysteria password: " pwd
sed -i "s/listen:.*/listen: :$port/" config.yaml
sed -i "s/password:.*/password: $pwd/" config.yaml
openssl req -x509 -nodes -newkey rsa:4096 -days 3650 -subj "/CN=amazon.com" -keyout server.key -out server.crt
ufw allow $port/udp
chown hysteria:hysteria *
systemctl enable --now hysteria-server.service
