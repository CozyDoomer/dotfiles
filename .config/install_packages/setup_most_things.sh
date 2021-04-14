# update base packages
sudo pacman -Syu

# install packages from pkg-list.txt
sudo pacman -S --needed - < pkg-list.txt

## build aur packages
# install neovim and add config
pamac build neovim-nightly-git
bash <(curl -s https://raw.githubusercontent.com/CozyDoomer/nvcode/master/utils/installer/install.sh)
# use :PackerInstall in nvim

pamac build aws-cdk
pamac build teams
pamac build i3-gaps-rounded-git
pamac build python-pywalfox
pywalfox setup

# start docker service, add it to autostart create docker group and add user
systemctl start docker.service
systemctl enable docker.service
sudo groupadd docker
sudo usermod -aG docker $USER

# add anydesk service to autostart
systemctl enable anydesk

# remove palemoon browser
sudo pacman -Qsq '^palemoon' | sudo pacman -R -

# update new packages
sudo pacman -Syu
