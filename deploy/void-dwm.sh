#!/usr/bin/env bash

sudo xbps-install -Su git make gcc pkg-config stow libX11-devel libXft-devel libXinerama-devel harfbuzz-devel xorg xcompmgr slock xwallpaper tesseract tesseract-ocr-eng nsxiv maim xclip clipmenu pulseaudio alsa-plugins-pulseaudio brightnessctl seatd turnstile xdg-utils vim wget

git clone https://github.com/yongrongwang/dot-files.git ~/.dot-files-dwm
mkdir -p ~/.local/src
mkdir -p ~/.local/bin
mkdir -p ~/.local/share
cd ~/.dot-files-dwm
git checkout dwm
stow .
cd .local/src/dwm
sudo make install clean
cd ../st
sudo make install clean
cd ../dmenu
sudo make install clean
cd ../dwmblocks
sudo make install clean

sudo mkdir /etc/udev/rules.d
sudo cp ~/.dot-files-dwm/deploy/30-touchpad.conf /etc/X11/xorg.conf.d/
sudo chown root:root /etc/X11/xorg.conf.d/30-touchpad.conf
sudo vim /etc/acpi/handler.sh
sudo bash -c "echo '%wheel ALL = NOPASSWD: /usr/bin/reboot, /usr/bin/poweroff, /usr/bin/zzz, /usr/bin/shutdown' >> /etc/sudoers.d/wheel"
sudo chmod 640 /etc/sudoers.d/wheel

sudo ln -s /etc/sv/dbus /var/service/
sudo sv up dbus
sudo ln -s /etc/sv/turnstile /var/service/
sudo sv up turnstile
sudo ln -s /etc/sv/seatd /var/service/
sudo sv up seatd
sudo usermod -aG _seatd $USER
sudo ln -s /etc/sv/acpid /var/service/
sudo sv up acpid
sudo ln -s /etc/sv/bluetoothd /var/service/
sudo sv up bluetoothd
sudo usermod -aG bluetooth $USER
sudo sv down wpa_supplicant
sudo rm /var/service/wpa_supplicant
sudo ln -s /etc/sv/iwd /var/service/
sudo sv up iwd
impala
mkdir -p ~/.config/service/dbus
ln -s /usr/share/examples/turnstile/dbus.run ~/.config/service/dbus/run
startx

mkdir ~/.local/share/fonts/SauceCodeProNerdFont
cd ~/.local/share/fonts/SauceCodeProNerdFont
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/SourceCodePro.zip
unzip SourceCodePro.zip
rm SourceCodePro.zip
fc-cache -f -v
