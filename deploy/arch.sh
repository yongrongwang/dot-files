#!/usr/bin/env bash

echo "Server = https://mirrors.cat.net/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
pacman -Syu --needed zsh
chsh -s /usr/bin/zsh
reboot
pacman -Syu --needed inetutils stow man-db man-pages zsh-autosuggestions zsh-syntax-highlighting nodejs-lts-jod npm fd ripgrep fzf luarocks tmux neovim lazygit diff-so-fancy btop
mandb
sed -zi '/vim/!s/$/EDITOR=vim\n/' /etc/environment

mkdir ~/.config
git clone https://github.com/yongrongwang/dot-files.git ~/.dot-files
cd ~/.dot-files
stow .
git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/tmux-plugins/tpm
tmux
nvim
