#!/bin/sh

# TODO: this doesn't work!
touch /etc/X11/xinit/xinitrc.d/95-nvidia-settings
echo "#!/bin/sh" > /etc/X11/xinit/xinitrc.d/95-nvidia-settings
echo "/usr/bin/nvidia-settings --load-config-only" >> /etc/X11/xinit/xinitrc.d/95-nvidia-settings

# update base packages
sudo pacman -Syu

# install packages from pkg-list.txt
sudo pacman -S --needed - < pkg-list.txt

# setup printer
pamac install manjaro-printer
sudo gpasswd -a cozy sys

pamac install system-config-printer
# then call system-config-printer and
# install printer drivers

sudo systemctl enable --now cups.service
sudo systemctl enable --now cups.socket
sudo systemctl enable --now cups.path

## build aur packages
# keyboard
pamac build zsa-wally-bin

# mic noise suppression
pamac build noise-suppression-for-voice

# secondary editor
pamac build vscodium-bin

# password manager
pamac build bitwarden-cli
bw login

# music player
pamac build youtube-music-bin

# list partitions and easy automount
pamac build gnome-disk-utility

# visualize disk space usage
pamac build baobab

sudo npm i -g eslint_d
pamac build python-lsp-server

# work stuff
pamac build teams
pamac build openfortivpn
pamac build tigervnc

# rice
pamac build i3-gaps-rounded-git
pamac build python-pywalfox
pywalfox install

# start docker service, add it to autostart create docker group and add user
systemctl start docker.service
systemctl enable docker.service
sudo groupadd docker
sudo usermod -aG docker $USER

# remove palemoon browser
sudo pacman -Qsq '^palemoon' | sudo pacman -R -

# install jupyter lab
pip install jupyterlab
