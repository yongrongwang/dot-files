#!/usr/bin/env bash

bash -c "$(curl -fsSL https://get.hy2.sh/)"
cd /etc/hysteria
openssl req -x509 -nodes -newkey rsa:4096 -days 3650 -subj "/CN=amazon.com" -keyout server.key -out server.crt
ufw allow 443/udp
cp -f ~/.dot-files/.local/bin/hysteria-server.yaml config.yaml
read "port?Port for hysteria: "
read "pwd?Password for hysteria: "
sed -i "s/listen:.*/listen: :$port/g" config.yaml
sed -i "s/password:.*/password: $pwd/g" config.yaml
chown hysteria:hysteria *
systemctl enable --now hysteria-server.service
systemctl status hysteria-server.service
