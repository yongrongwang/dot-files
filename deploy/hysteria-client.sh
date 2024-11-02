#!/usr/bin/env bash

sudo bash -c "$(curl -fsSL https://get.hy2.sh/)"
read "ip?IP for hysteria: "
read "port?Port for hysteria: "
read "pwd?Password for hysteria: "
cd /etc/hysteria
sudo cp -f ~/.dot-files-sway/deploy/hysteria-client.yaml config.yaml
sudo sed -i "s/server:.*/server: $ip:$port/g" config.yaml
sudo sed -i "s/auth:.*/auth: $pwd/g" config.yaml
sudo chown hysteria:hysteria *
cd /etc/systemd/system
sudo sed -i "s/server/client/g" hysteria-server.service
sudo sed -i "s/Server/Client/g" hysteria-server.service
sudo sed -i "/ExecStart/iExecStartPre=/bin/sh -c 'until ping -c 1 -w 1 baidu.com; do sleep 1; done;'" hysteria-server.service
sudo mv hysteria-server.service hysteria-client.service
sudo systemctl enable --now hysteria-client.service
systemctl status hysteria-client.service
export http_proxy=http://127.0.0.1:8080/ https_proxy=http://127.0.0.1:8080/
