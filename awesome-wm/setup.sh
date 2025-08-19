#! usr/bin/bash
username=$(id -u -n 1000)
builddir=$(pwd)

# Update packages list and update system
sudo apt update
sudo apt upgrade -y

# Install packges for desktop setup
sudo apt install make xorg libxcb-xfixes0-dev sddm awesome -y
# sudo apt install --no-install-recommends sddm -y

## Added sddm themes
# sudo apt install qml-module-qtquick-window2 qml-module-qtquick-layouts qml-module-qtquick-controls2 libqt6svg6
# sudo cp -r ${builddir}/catppuccin-macchiato /usr/share/sddm/themes/catppuccin-macchiato
# Added theme to sddm.conf
# sudo cp -f ${builddir}/sddm.conf /etc/sddm.conf

# Config Sddm to run on next login
sudo dpkg-reconfigure sddm

# Setup Awesome WM and x11 TearFree
# mkdir -p "/home/$username/.config/awesome"
# sudo mkdir /usr/share/xsessions
# sudo cp -f ${builddir}/awesome.desktop /usr/share/xsessions/
# if [ -d "/etc/X11/xorg.conf.d" ]; then
#    sudo cp -f ${builddir}/20-amd.conf /etc/X11/xorg.conf.d/
# fi

# Setup Config files
git clone https://github.com/tobi9090/dotfiles.git /home/$username/dotfiles
git clone https://github.com/tobi9090/fonts.git /home/$username/.local/share/fonts
bash /home/$username/dotfiles/update.sh --all