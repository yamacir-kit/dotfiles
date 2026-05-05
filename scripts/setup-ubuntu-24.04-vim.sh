#!/bin/sh -eu

dotfiles=$(cd "$(dirname "$0")/.."; pwd)

sudo apt update
sudo apt remove vim-tiny
sudo apt install vim-gtk3
sudo apt autoremove
sudo apt autoclean

vi --version

vim=$dotfiles/vim

cd "$dotfiles"

bundle=$dotfiles/.vim/bundle

if test ! -d "$bundle"
then
  mkdir -p "$bundle"
  if test ! -e "$bundle/Vundle.vim"
  then
    git clone https://github.com/VundleVim/Vundle.vim "$bundle/Vundle.vim"
  fi
fi

vim -c PluginInstall -c qa
vim -c PluginUpdate -c qa

cd "$bundle/YouCompleteMe"

python3 ./install.py --clangd-completer
