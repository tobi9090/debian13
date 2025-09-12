#! usr/bin/bash
username=$(id -u -n 1000)

# # VsCode
# curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
# sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/keyrings/microsoft-archive-keyring.gpg
# sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt update
sudo apt upgrade

# Install APT packages
sudo apt install gamemode mangohud nitrogen gcc lxappearance alacritty btop rofi picom wget vim unzip network-manager pulseaudio pamixer pavucontrol fzf mpv virt-manager qemu-system-x86 qemu-utils libvirt-daemon-system p7zip-full xclip lua5.1 ripgrep wine neovim lutris qimgv winetricks lazygit

# Install outside for APT packages
cd "/home/$username/download"
wget -O vscode-new.deb https://code.visualstudio.com/docs/?dv=linux64_deb
sudo apt install ./discord-new.deb ./vscode-new.deb
rm -rf "/home/$username/download/discord-new.deb"
cd "/home/$username"

# Maybe in the future
# sudo apt install pipewire pipewire-audio-client-libraries pipewire-audio wireplumber pipewire-pulse
# systemctl --user --now enable wireplumber.service
## https://wiki.debian.org/PipeWire ##

systemctl --user restart pulseaudio.service
sudo usermod --append --groups libvirt $username

# Install themes
sudo apt install orchis-gtk-theme oxygencursors arc-theme papirus-icon-theme -y

# Install Flatpak
sudo apt install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub org.chromium.Chromium

# Install Rost and Cargo
curl https://sh.rustup.rs -sSf | sh

# File Manager
cargo install --locked yazi-fm yazi-cli

