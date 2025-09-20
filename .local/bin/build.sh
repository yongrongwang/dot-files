#!/bin/sh

cd ~/.dot-files-dwm/.local/src/dwm
sudo make install clean
cd ../st
sudo make install clean
cd ../dmenu
sudo make install clean
cd ../dwmblocks
sudo make install clean
