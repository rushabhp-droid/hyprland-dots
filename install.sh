#!/bin/sh

set -e

# Function to install required packages
install_packages() {
  sudo pacman -Syu
  yay -S ttf-jetbrains-mono-nerd alacritty rofi-wayland swaync hyprpaper-git hyprland-git
}

# Function to back up and copy configuration files
delete_and_copy_configs() {
  rm -rf ~/.config/{hypr,rofi,alacritty}
  cp -r config/* ~/.config/
}
# Main function
main() {
  install_packages "$@"
  delete_and_copy_configs
}

# Execute main function with all input parameters
main "$@"
