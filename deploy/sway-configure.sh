#!/bin/sh
sudo bash -c "echo 'EDITOR=vim' > /etc/environment"
sudo mkdir /etc/systemd/logind.conf.d
sudo bash -c "echo -e '[Login]\nHandlePowerKey=suspend' > /etc/systemd/logind.conf.d/power-key.conf"
sudo bootctl set-timeout "0"
sudo pacman -Syu --needed man-db man-pages inetutils stow zsh-autosuggestions zsh-syntax-highlighting nodejs-lts-jod npm luarocks fd ripgrep fzf neovim tmux lazygit diff-so-fancy nnn udisks2 btop sway swaybg swaylock swayidle noto-fonts noto-fonts-extra noto-fonts-cjk noto-fonts-emoji ttf-sourcecodepro-nerd vulkan-intel intel-media-driver bluetui impala pulseaudio-alsa pulseaudio-bluetooth brightnessctl playerctl xorg-xwayland xdg-utils polkit-gnome ly dunst libnotify bemenu bemenu-wayland j4-dmenu-desktop cliphist foot imv mpv jack2 grim slurp wf-recorder zathura zathura-pdf-mupdf tesseract-data-eng qutebrowser qt6-wayland upower
sudo mandb -q
sudo systemctl enable bluetooth.service ly.service
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
git clone https://github.com/yongrongwang/dot-files.git ~/.dot-files
cd ~/.dot-files
mkdir -p ~/.local/share
stow .
chsh -s /usr/bin/zsh
