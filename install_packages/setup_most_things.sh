# update base packages
sudo pacman -Syu

# install packages from pkg-list.txt
sudo pacman -S --needed - < pkg-list.txt

# build aur packages
pamac build aws-cdk
pamac build anydesk-bin
pamac build teams
pamac build i3-gaps-rounded-git

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
