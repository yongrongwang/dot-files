#!/usr/bin/env bash

sudo xbps-install -Su git make gcc pkg-config libX11-devel libXft-devel libXinerama-devel harfbuzz-devel xorg xcompmgr

git clone https://github.com/yongrongwang/dot-files.git ~/.dot-files-dwm
mkdir ~/.local
cd ~/.dot-files-dwm
git checkout dwm
cp -r .local/bin ~/.local/
cd .local/src/dwm
sudo make install clean
cd ../st
sudo make install clean
cd ../dmenu
sudo make install clean
cd ../dwmblocks
sudo make install clean
startx

rm ~/.zshrc
cat ~/.dot-files/scripts/arch/configure-common.sh
sudo xbps-install -Su stow slock xwallpaper vim wget pipewire iwd impala bluez libspa-bluetooth bluetui acpilight maim xclip ffmpeg xdotool tesseract nsxiv
