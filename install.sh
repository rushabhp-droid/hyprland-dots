#!/bin/sh

sudo pacman -Syu
sudo pacman -S ttf-jetbrains-mono-nerd $1 alacritty rofi-wayland $2


# BACK UP existing config files :)
rm -rf ~/.config/{hypr,rofi,alacritty}
cp -r config/* ~/.config/
