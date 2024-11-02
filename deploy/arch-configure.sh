#!/bin/sh
cd /boot/loader/entries
cp -f /usr/share/systemd/bootctl/loader.conf ../
cp /usr/share/systemd/bootctl/arch.conf ./
uuid=$(blkid -s UUID -o value /dev/nvme0n1p2)
sed -i "s/PARTUUID.*/UUID=$uuid rw/" arch.conf
sed -i "/initrd/i initrd  /intel-ucode.img" arch.conf
sed -i "s/-linux/-linux-lts/g" arch.conf
mkdir /etc/iwd
echo -e "[General]\nEnableNetworkConfiguration=true" > /etc/iwd/main.conf
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
systemctl enable systemd-timesyncd.service systemd-resolved.service iwd.service sshd.service
