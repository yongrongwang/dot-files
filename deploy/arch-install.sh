#!/bin/sh
lsblk
fdisk /dev/nvme0n1
mkfs.ext4 /dev/nvme0n1p2
mkfs.fat -F 32 /dev/nvme0n1p1
mount /dev/nvme0n1p2 /mnt
mount -m -o fmask=0077,dmask=0077 /dev/nvme0n1p1 /mnt/boot
echo "Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
pacstrap -K /mnt base base-devel linux-lts linux-firmware intel-ucode iwd vim openssh
genfstab -U /mnt > /mnt/etc/fstab
bootctl install --esp-path=/mnt/boot
arch-chroot /mnt
