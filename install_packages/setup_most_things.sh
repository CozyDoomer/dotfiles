# update base packages
sudo pacman -Syu

# install packages from pkg-list.txt
sudo pacman -S --needed - < pkg-list.txt

## build aur packages

pamac build htop-vim-git
pamac build vscodium-bin
pamac build bitwarden-cli

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
