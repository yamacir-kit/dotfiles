#!/bin/bash -eu

sudo apt-add-repository -y ppa:jonathonf/vim
sudo apt update

sudo apt install -y build-essential
sudo apt install -y cmake
sudo apt install -y python3-dev
sudo apt install -y vim-gnome

bundle=$(dirname "$0")/../.vim/bundle

mkdir -p "$bundle"

if test ! -e "$bundle/Vundle.vim"
then
  git clone https://github.com/VundleVim/Vundle.vim.git "$bundle/Vundle.vim"
fi

vi -c PluginInstall -c qa

python3 "$bundle/YouCompleteMe/install.py" --clangd-completer

sudo apt remove -y vim-tiny
