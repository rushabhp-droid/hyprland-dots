#!/bin/sh

set -e

# Function to install required packages
install_packages() {
  sudo pacman -Syu
  sudo pacman -S ttf-jetbrains-mono-nerd alacritty rofi-wayland $1 $2
}

# Function to back up and copy configuration files
backup_and_copy_configs() {
  rm -rf ~/.config/{hypr,rofi,alacritty}
  cp -r config/* ~/.config/
}

# Validate input parameters
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <package1> <package2>"
  exit 1
fi

# Main function
main() {
  install_packages "$@"
  backup_and_copy_configs
}

# Execute main function with all input parameters
main "$@"
