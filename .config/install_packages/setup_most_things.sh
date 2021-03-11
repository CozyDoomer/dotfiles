# update base packages
sudo pacman -Syu

# install packages from pkg-list.txt
sudo pacman -S --needed - < pkg-list.txt

## build aur packages
# install neovim and add config
pamac build neovim-git
pip install pynvim
npm i -g neovim
pip install neovim-remote
# use :UpdateRemotePlugins in vscode

pamac build aws-cdk
pamac build teams
pamac build i3-gaps-rounded-git
pamac build python-pywalfox
pywalfox setup

pamac build beautifuldiscord-git
cd ../rice
git clone https://github.com/guglicap/wal-discord.git
chmod +x ./wal-discord/wal-discord
sudo ln -s "${PWD}/wal-discord/wal-discord" /usr/bin/
discord; wal-discord; beautifuldiscord --css ~/.cache/wal-discord/style.css
cd ../install_packages

pamac build python-wal-steam-git
wal_steam -d -u
wal_steam -w

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
