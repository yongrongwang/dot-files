#!/usr/bin/env bash

iwctl station wlan0 show
cat /etc/pacman.d/mirrorlist
sudo pacman -Rsun wmenu waybar pavucontrol htop
sudo pacman -Syu --needed inetutils stow cmake git nodejs-lts-jod npm python-pip fd ripgrep fzf luarocks tldr man-db man-pages tmux neovim lazygit diff-so-fancy nnn btop zip unzip wl-clipboard playerctl power-profiles-daemon python-gobject bluez bluez-utils bluetui impala fprintd iptables-nft ufw fwupd udisks2 noto-fonts-cjk noto-fonts-extra noto-fonts-emoji ttf-sourcecodepro-nerd xdg-desktop-portal-gtk xdg-desktop-portal-wlr polkit-gnome bemenu bemenu-wayland j4-dmenu-desktop cliphist dunst libnotify rtkit mpv wf-recorder imv zathura zathura-pdf-mupdf tesseract-data-eng fcitx5 fcitx5-configtool fcitx5-qt fcitx5-chinese-addons
sudo pacman -Scc
sudo mandb

sudo bootctl set-timeout "0"
sudo mkdir /etc/systemd/logind.conf.d
mkdir ~/.local/state/ly
sudo bash -c "echo -e '[Login]\nHandlePowerKey=suspend' > /etc/systemd/logind.conf.d/power-key.conf"
sudo sed -zi '/nvim/!s/$/EDITOR=nvim\n/' /etc/environment
sudo sed -zi '/multi-user.target/!s/$/\n[Install]\nWantedBy=multi-user.target\n/' /usr/lib/systemd/system/fprintd.service
sudo sed -zi '/pam_fprintd.so/!s/auth/auth sufficient pam_unix.so try_first_pass likeauth nullok\nauth sufficient pam_fprintd.so\nauth/' /etc/pam.d/swaylock
sudo sed -i "s/^#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=1s/g" /etc/systemd/system.conf
sudo sed -i "s/^# deny.*/deny = 10/g" /etc/security/faillock.conf
sudo sed -i "s/^session_log.*/session_log = .local\/state\/ly\/ly-session.log/g" /etc/ly/config.ini
sudo systemctl enable --now bluetooth.service power-profiles-daemon.service fprintd.service ufw.service
systemctl status bluetooth.service power-profiles-daemon.service fprintd.service ufw.service
sudo powerprofilesctl set power-saver
sudo ufw enable
sudo ufw allow 22/tcp
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
fprintd-enroll

ssh-keygen -t ed25519 -C "2278508989@qq.com"
cat ~/.ssh/id_ed25519.pub
ssh -T git@github.com
mkdir -p ~/Documents/repos
cd ~/Documents/repos
while : ; do
    sudo bash -c "
    rm -rf ble.sh dot-files notes
    git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
    git clone https://github.com/yongrongwang/dot-files.git
    git clone https://github.com/yongrongwang/notes.git
    chown -R yrw:yrw ble.sh dot-files notes
    "
    [ $? -ne 0 ] || break
done
make -C ble.sh install PREFIX=~/.local
mkdir ~/.local/share/
rm ~/.bashrc ~/.bash_profile
rm -rf ~/.dot-files
mv dot-files ~/.dot-files
cd ~/.dot-files
stow .
ln -s ~/.dot-files/.mozilla/firefox/default-release/chrome ~/.mozilla/firefox/*.default-release/

read -p "Install hysteria? (y/N): " inst
if [[ "$inst" == "y" ]]; then
    while : ; do
        sudo bash -c "$(curl -fsSL https://get.hy2.sh/)"
        [ $? -ne 0 ] || break
    done
    sudo cp -f etc/hysteria/config-client.yaml /etc/hysteria/config.yaml
    read -p "IP for hysteria: " ip
    read -p "Port for hysteria: " port
    read -p "Password for hysteria: " pwd
    sudo sed -i "s/server:.*/server: $ip:$port/g" /etc/hysteria/config.yaml
    sudo sed -i "s/auth:.*/auth: $pwd/g" /etc/hysteria/config.yaml
    sudo sed -i "s/server/client/g" /etc/systemd/system/hysteria-server.service
    sudo sed -i "/ExecStart/iExecStartPre=/bin/sh -c 'until ping -c 1 -w 1 baidu.com; do sleep 1; done;'" /etc/systemd/system/hysteria-server.service
    sudo chown hysteria:hysteria /etc/hysteria/*
    sudo systemctl enable --now hysteria-server.service
    systemctl status hysteria-server.service
fi

cd -
rm -rf ble.sh
read -p "IP to ssh: " host
mkdir ~/.config/gtk-3.0
echo -e "[Settings]\ngtk-application-prefer-dark-theme=1" > ~/.config/gtk-3.0/settings.ini
echo -e "Host v\n  HostName\n  User root\n  ServerAliveInterval 600" > ~/.ssh/config
sed -i "s/HostName.*/HostName $host/g" ~/.ssh/config
export http_proxy=http://127.0.0.1:8080/
export https_proxy=$http_proxy
sleep 1
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux-plugins/tpm
sh -c "$(curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs)"
nvim
find ~/.cache/ -type f -amin +1 -delete

git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd -
rm -rf yay-bin
ssh-copy-id v
fwupdmgr refresh
fwupdmgr update
sudo reboot
