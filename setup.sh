#! usr/bin/bash
username=$(id -u -n 1000)

mkdir -p "/home/$username/pictures"
mkdir -p "/home/$username/music"
mkdir -p "/home/$username/Videos"
mkdir -p "/home/$username/documents"
mkdir -p "/home/$username/download"
mkdir -p "/home/$username/projekts"
mkdir -p "/home/$username/git-repos"
mkdir -p "/home/$username/.local/share/fonts"

# Clone github repo
git clone https://github.com/tobi9090/dotfiles.git /home/$username/dotfiles
git clone https://github.com/tobi9090/fonts.git /home/$username/.local/share/fonts