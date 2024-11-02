#!/bin/sh
sudo bash -c "$(curl -fsSL https://get.hy2.sh/)"
cd /etc/hysteria
sudo cp -f ~/.dot-files/deploy/hysteria-client.yaml config.yaml
read -p "Hysteria ip: " ip
read -p "Hysteria port: " port
read -p "Hysteria password: " pwd
sudo sed -i "s/server:.*/server: $ip:$port/" config.yaml
sudo sed -i "s/auth:.*/auth: $pwd/" config.yaml
sudo chown hysteria:hysteria *
cd /etc/systemd/system
sudo sed -i "s/server/client/" hysteria-server.service
sudo sed -i "s/Server/Client/" hysteria-server.service
sudo sed -i "/ExecStart/i ExecStartPre=/bin/sh -c 'until ping -c 1 -w 1 baidu.com; do sleep 1; done;'" hysteria-server.service
sudo mv hysteria-server.service hysteria-client.service
sudo systemctl enable --now hysteria-client.service
