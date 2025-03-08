#!/bin/sh

set -e

# Function to install required packages
install_packages() {
  yay -Syu ttf-jetbrains-mono-nerd alacritty rofi-wayland swaync hyprpaper-git hyprland-git pavucontrol sof-firmware pipewire pipewire-alsa pipewire-jack pipewire-pulse pipewire-rtkit wireplumber sddm wl-clipboard
}

# Function to back up and copy configuration files
delete_and_copy_configs() {
  rm -rf ~/.config/{hypr,rofi,alacritty}
  cp -r config/* ~/.config/
}

install_sddm_theme() {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/keyitdev/sddm-astronaut-theme/master/setup.sh)"
}

# Main function
main() {
  install_packages "$@"
  delete_and_copy_configs
  install_sddm_theme
}


# Execute main function with all input parameters
main "$@"
