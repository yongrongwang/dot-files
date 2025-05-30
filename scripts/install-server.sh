#!/usr/bin/env bash

echo "Server = https://mirrors.cat.net/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
sed -i "s/^#IgnorePkg.*/IgnorePkg   = cloud-init/g" /etc/pacman.conf
pacman -Syu --needed bc inetutils stow imagemagick cmake ninja meson nodejs-lts-jod npm python-pip ripgrep fzf fd luarocks tldr man-pages tmux neovim lazygit nnn btop foot-terminfo
pacman -Scc
mandb
sed -zi '/nvim/!s/$/EDITOR=nvim\n/' /etc/environment

git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
git clone https://github.com/yongrongwang/dot-files.git ~/.dot-files
make -C ble.sh install PREFIX=~/.local
mkdir -p ~/.config ~/.local/share/
cd ~/.dot-files
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
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux-plugins/tpm
sh -c "$(curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs)"
nvim
find ~/.cache/ -type f -amin +1 -delete
reboot
