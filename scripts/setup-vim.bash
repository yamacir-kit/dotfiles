#!/bin/bash -eux

dotfiles=$(cd "$(dirname $0)/.."; pwd)

sudo apt-add-repository -y ppa:jonathonf/vim
sudo apt update
sudo apt install -y vim-gnome
sudo apt remove -y vim-tiny

bundle=$dotfiles/.vim/bundle

mkdir -p $bundle
if test ! -e $bundle/Vundle.vim
then
  git clone https://github.com/VundleVim/Vundle.vim.git $bundle/Vundle.vim
fi

vi -c PluginInstall -c qa

sudo apt install -y build-essential cmake python3-dev
python3 $bundle/YouCompleteMe/install.py --clang-completer

