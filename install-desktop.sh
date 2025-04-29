#!/usr/bin/env bash

cat /etc/pacman.d/mirrorlist
sudo pacman -Syu --needed neovim cmake nodejs-lts-jod npm python-pip fd luarocks wl-clipboard speech-dispatcher tldr fprintd power-profiles-daemon lazygit btop ufw fwupd noto-fonts-cjk noto-fonts-extra ttf-sourcecodepro-nerd man-db man-pages gwenview okular haruna kitty filelight isoimagewriter fcitx5 fcitx5-configtool fcitx5-gtk fcitx5-qt fcitx5-chinese-addons libreoffice-fresh
sudo pacman -Scc
sudo mandb

sudo bootctl set-timeout "0"
sudo systemctl edit --full --force fprintd
sudo bash -c 'echo "EDITOR=nvim" >> /etc/environment'
sudo bash -c 'echo -e "140.82.116.3 github.com\n108.61.13.174 vultr.com\n104.16.133.229 cloudflare.com" >> /etc/hosts'
sudo bash -c 'echo -e "[General]\nGreeterEnvironment=QT_SCREEN_SCALE_FACTORS=2.0" >> /etc/sddm.conf'
sudo bash -c 'echo -e "\n[Install]\nWantedBy=multi-user.target" >> /etc/systemd/system/fprintd.service'
sudo sed -i "s/^#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=1s/g" /etc/systemd/system.conf
sudo sed -i "s/^# deny.*/deny = 10/g" /etc/security/faillock.conf

sudo systemctl enable --now bluetooth
sudo systemctl enable --now power-profiles-daemon
sudo systemctl enable --now fprintd
sudo systemctl enable --now ufw
sudo ufw enable
sudo ufw allow 22/tcp

git config --global user.name "yongrongwang"
git config --global user.email "2278508989@qq.com"
ssh-keygen -t ed25519 -C "2278508989@qq.com"
cat ~/.ssh/id_ed25519.pub
while : ; do
    sudo bash -c "$(curl -fsSL https://get.hy2.sh/)"
    [ $? -ne 0 ] || break
done
ssh -T git@github.com

mkdir -p ~/Documents/repos
cd ~/Documents/repos
while : ; do
    rm -rf ~/.config/nvim ble.sh dot-files notes
    git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
    git clone https://github.com/yongrongwang/starter.git ~/.config/nvim
    git clone https://github.com/yongrongwang/dot-files.git
    git clone https://github.com/yongrongwang/notes.git
    [ $? -ne 0 ] || break
done

make -C ble.sh install PREFIX=~/.local
cd dot-files
cp .bash* ~/
cp -r .config/* ~/.config/
sudo cp -f etc/hysteria-client/config.yaml /etc/hysteria/config.yaml
cd ..
rm -rf ble.sh

read -p "IP to ssh: " host
read -p "IP for hysteria: " ip
read -p "Port for hysteria: " port
read -p "Password for hysteria: " pwd
echo -e "Host v\n  HostName\n  User root\n  ServerAliveInterval 600" >> ~/.ssh/config
sed -i "s/HostName.*/HostName $host/g" ~/.ssh/config
sudo sed -i "s/server:.*/server: $ip:$port/g" /etc/hysteria/config.yaml
sudo sed -i "s/auth:.*/auth: $pwd/g" /etc/hysteria/config.yaml
sudo sed -i "s/server/client/g" /etc/systemd/system/hysteria-server.service
sudo sed -i "/ExecStart/iExecStartPre=/bin/sh -c 'until ping -c 1 baidu.com; do sleep 1; done;'" /etc/systemd/system/hysteria-server.service

sudo chown hysteria /etc/hysteria/*
sudo systemctl enable --now hysteria-server
systemctl status hysteria-server

export http_proxy=http://127.0.0.1:8080/
export https_proxy=$http_proxy
sleep 1
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd ..
rm -rf yay-bin

ssh-copy-id v
fwupdmgr refresh
fwupdmgr update

nvim
find ~/.cache/ -type f -amin +1 -delete
sudo reboot
