#!/bin/sh

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock -w
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
read -p "Host name: " host
echo "$host" > /etc/hostname
echo "127.0.1.1        $host" >> /etc/hosts
passwd
read -p "User: " user
useradd -mG wheel,audio,video,input $user
passwd $user
sed -i "0,/# %wheel/s//%wheel/" /etc/sudoers
mkdir /etc/iwd
echo -e "[General]\nEnableNetworkConfiguration=true" > /etc/iwd/main.conf
systemctl enable systemd-timesyncd.service systemd-resolved.service iwd.service sshd.service
