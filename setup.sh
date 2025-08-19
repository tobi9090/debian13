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
if [[ -d "/home/$username/dotfiles" ]]; then
    git pull /home/$username/dotfiles
else
    git clone https://github.com/tobi9090/dotfiles.git /home/$username/dotfiles
fi

if [[ -d "/home/$username/.local/share/fonts" ]]; then
    git pull /home/$username/.local/share/fonts
else
    git clone https://github.com/tobi9090/fonts.git /home/$username/.local/share/fonts
fi