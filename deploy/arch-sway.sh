#!/usr/bin/env bash

sudo pacman -Rsun wmenu waybar pavucontrol htop nano
sudo pacman -Syu --needed qutebrowser bluetui impala nnn noto-fonts-cjk noto-fonts-extra noto-fonts-emoji mpv zathura zathura-pdf-mupdf dunst libnotify rtkit tesseract-data-eng ttf-sourcecodepro-nerd bemenu bemenu-wayland j4-dmenu-desktop imv wf-recorder wl-clipboard cliphist polkit-gnome xdg-desktop-portal-gtk xdg-desktop-portal-wlr

sudo mkdir /etc/systemd/logind.conf.d
sudo bash -c "echo -e '[Login]\nHandlePowerKey=suspend' > /etc/systemd/logind.conf.d/power-key.conf"
sudo sed -i "s/^#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=1s/g" /etc/systemd/system.conf
sudo sed -i "s/^# deny.*/deny = 10/g" /etc/security/faillock.conf
mkdir -p ~/.local/state/ly
sudo sed -i "s/^session_log.*/session_log = .local\/state\/ly\/ly-session.log/g" /etc/ly/config.ini
rm ly-session.log
sudo systemctl enable --now bluetooth.service
sudo bootctl set-timeout "0"
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

mkdir ~/.local/share
git clone https://github.com/yongrongwang/dot-files.git ~/.dot-files-sway
cd ~/.dot-files-sway
git checkout sway
stow .
