#!/bin/sh

touch /etc/X11/xinit/xinitrc.d/95-nvidia-settings
echo "#!/bin/sh" > /etc/X11/xinit/xinitrc.d/95-nvidia-settings
echo "/usr/bin/nvidia-settings --load-config-only" >> /etc/X11/xinit/xinitrc.d/95-nvidia-settings

# update base packages
sudo pacman -Syu

# install packages from pkg-list.txt
sudo pacman -S --needed - < pkg-list.txt

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

# setup anaconda for python package management
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p $HOME/miniconda
export PATH="$HOME/miniconda/bin:$PATH"
conda init fish

sudo npm i -g eslint_d

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

# create jupyter environment and install extensions and theme
conda create -n "jupyter" python=3.8
pip install jupyter jupyter_contrib_nbextensions
jupyter nbextension enable toc2/main
jupyter nbextension enable collapsible_headings/main
jupyter nbextension enable cscratchpad/main
jupyter nbextension enable snippets_menu/main
jupyter nbextension enable gist_it/main
jupyter nbextension enable keyboard_shortcut_menu/main

mkdir -p "$(jupyter --data-dir)"/nbextensions
git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
jupyter nbextension enable vim_binding/vim_binding
rm -rf vim_binding

jupyter contrib nbextension install --user

pip install jupyterthemes
jt -t chesterish -vim

