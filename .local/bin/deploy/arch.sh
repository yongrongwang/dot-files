#!/usr/bin/env bash

echo "Server = https://mirrors.cat.net/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
pacman -Syu --needed zsh
chsh -s /usr/bin/zsh
reboot
pacman -Syu --needed inetutils stow zsh-autosuggestions zsh-syntax-highlighting cmake nodejs-lts-jod npm python-pip fd ripgrep fzf luarocks tldr man-db man-pages tmux neovim lazygit diff-so-fancy btop
mandb

mkdir ~/.config
git clone https://github.com/yongrongwang/dot-files.git ~/.dot-files
cd ~/.dot-files
stow .
nvim
git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/tmux-plugins/tpm
