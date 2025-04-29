#!/usr/bin/env bash

echo "Server = https://jp.mirrors.cicku.me/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
sed -i "s/^#IgnorePkg.*/IgnorePkg   = cloud-init/g" /etc/pacman.conf
pacman -Syu --needed neovim cmake nodejs-lts-jod npm ripgrep fd luarocks tldr lazygit glances man-pages
pacman -Scc
mandb

bash -c "$(curl -fsSL https://get.hy2.sh/)"
openssl req -x509 -nodes -newkey rsa:4096 -days 3650 -subj "/CN=amazon.com" -keyout /etc/hysteria/server.key -out /etc/hysteria/server.crt
ufw allow 443/udp

git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
git clone https://github.com/yongrongwang/starter.git ~/.config/nvim
git clone https://github.com/yongrongwang/dot-files.git

make -C ble.sh install PREFIX=~/.local
cd dot-files
cp .bash* ~/
cp -r .config/lazygit ~/.config/
cp -f etc/hysteria-server/config.yaml /etc/hysteria/config.yaml
cd ..
rm -rf dot-files ble.sh

read -p "Port for hysteria: " port
read -p "Password for hysteria: " pwd
sed -i "s/listen:.*/listen: :$port/g" /etc/hysteria/config.yaml
sed -i "s/password:.*/password: $pwd/g" /etc/hysteria/config.yaml

chown hysteria /etc/hysteria/*
systemctl enable --now hysteria-server
systemctl status hysteria-server

nvim
find ~/.cache/ -type f -amin +1 -delete
reboot
