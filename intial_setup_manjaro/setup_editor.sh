#!/usr/bin/env bash

branch=${1:-"release"}

if [ $branch == "release" ]
then
	echo "installing release version"
	bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/master/utils/installer/install-neovim-from-release)
	bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
elif [ $branch == "rolling" ]
then
	echo "installing rolling version"
	bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/rolling/utils/installer/install-neovim-from-release)
	LV_BRANCH=rolling bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/rolling/utils/installer/install.sh)
else
	echo "not a valid lvim version, pass one of 'release' or 'rolling'"
fi

# setup julia LSP
julia --project=~/.julia/environments/nvim-lspconfig -e 'using Pkg; Pkg.add("LanguageServer")'
