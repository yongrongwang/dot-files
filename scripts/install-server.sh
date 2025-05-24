#!/usr/bin/env bash

echo "Server = https://mirrors.cat.net//archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
sed -i "s/^#IgnorePkg.*/IgnorePkg   = cloud-init/g" /etc/pacman.conf
pacman -Syu --needed cpio bc inetutils stow cmake ninja meson nodejs-lts-jod npm python-pip ripgrep fd luarocks tldr man-pages tmux neovim lazygit nnn btop
pacman -Scc
mandb

git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
git clone https://github.com/yongrongwang/dot-files.git ~/.dot-files

make -C ble.sh install PREFIX=~/.local
cd ~/.dot-files
rm .bashrc .bash_profile
stow .

read -p "Install hysteria? (y/N): " inst
if [[ "$inst" == "y" ]]; then
    bash -c "$(curl -fsSL https://get.hy2.sh/)"
    openssl req -x509 -nodes -newkey rsa:4096 -days 3650 -subj "/CN=amazon.com" -keyout /etc/hysteria/server.key -out /etc/hysteria/server.crt
    ufw allow 443/udp

    cp -f etc/hysteria/config-server.yaml /etc/hysteria/config.yaml
    read -p "Port for hysteria: " port
    read -p "Password for hysteria: " pwd
    sed -i "s/listen:.*/listen: :$port/g" /etc/hysteria/config.yaml
    sed -i "s/password:.*/password: $pwd/g" /etc/hysteria/config.yaml

    chown hysteria:hysteria /etc/hysteria/*
    systemctl enable --now hysteria-server.service
    systemctl status hysteria-server.service
fi

cd -
rm -rf ble.sh
nvim
find ~/.cache/ -type f -amin +1 -delete
reboot
