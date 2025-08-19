#! usr/bin/bash
username=$(id -u -n 1000)
builddir=$(pwd)

# Update packages list and update system
sudo apt update
sudo apt upgrade -y

# Install packges for desktop setup
sudo apt install make xorg lightdm awesome -y

sudo cp -f ${builddir}/lightdm.conf /etc/lightdm/lightdm.conf
sudo cp -f ${builddir}/slick-greeter.conf /etc/lightdm/slick-greeter.conf
# Config Sddm to run on next login
sudo dpkg-reconfigure lightdm

# Setup x11 TearFree
# if [ -d "/etc/X11/xorg.conf.d" ]; then
#    sudo cp -f ${builddir}/20-amd.conf /etc/X11/xorg.conf.d/20-amd.conf
# fi

# Setup Config files
git clone https://github.com/tobi9090/dotfiles.git /home/$username/dotfiles
git clone https://github.com/tobi9090/fonts.git /home/$username/.local/share/fonts
bash /home/$username/dotfiles/update.sh --all

sudo cp -f /home/$username/dotfiles/Wallpapers/after_sunset_landscape_2_by_rmradev_dfenf9g.jpg /usr/share/wallpapers/login.jpg

