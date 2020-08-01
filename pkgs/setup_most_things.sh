sudo pacman -Syu
sudo pacman -S --needed - < pkg-list.txt
pamac build aws-cdk
pamac build anydesk-bin
pamac build zoom

systemctl start docker.service
systemctl enable docker.service
sudo groupadd docker
sudo usermod -aG docker $USER
systemctl enable anydesk

sudo pacman -Qsq '^palemoon' | sudo pacman -R -
sudo pacman -Syu
