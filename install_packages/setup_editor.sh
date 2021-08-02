# install neovim and add config

pamac build neovim
bash <(curl -s https://raw.githubusercontent.com/ChristianChiarulli/lunarvim/master/utils/installer/install.sh)
git clone https://github.com/CozyDoomer/lvim-config.git
mv lvim-config/* ~/.config/lvim/

