# update base packages
sudo pacman -Syu

# install packages from pkg-list.txt
sudo pacman -S --needed - < pkg-list.txt

## build aur packages

pamac build noise-suppression-for-voice
pamac build htop-vim-git
pamac build vscodium-bin
pamac build bitwarden-cli
pamac build youtube-music-bin

# setup anaconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p $HOME/miniconda
export PATH="$HOME/miniconda/bin:$PATH"
conda init fish

# work stuff
# pamac build aws-cdk
# pamac build teams
# TODO: setup vnc here

# rice
pamac build i3-gaps-rounded-git
pamac build python-pywalfox
pywalfox update

# start docker service, add it to autostart create docker group and add user
systemctl start docker.service
systemctl enable docker.service
sudo groupadd docker
sudo usermod -aG docker $USER

# remove palemoon browser
sudo pacman -Qsq '^palemoon' | sudo pacman -R -

# update new packages
sudo pacman -Syu

conda create -n "jupyter" python=3.8
pip install jupyter jupyter_contrib_nbextensions
jupyter nbextension enable toc2/main
jupyter nbextension enable collapsible_headings/main
jupyter nbextension enable cscratchpad/main
jupyter nbextension enable snippets_menu/main
jupyter nbextension enable gist_it/main
jupyter nbextension enable keyboard_shortcut_menu/main

mkdir -p $(jupyter --data-dir)/nbextensions
git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
jupyter nbextension enable vim_binding/vim_binding

jupyter contrib nbextension install --user

pip install jupyterthemes
jt -t chesterish -vim

