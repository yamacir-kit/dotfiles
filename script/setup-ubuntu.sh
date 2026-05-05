#!/bin/sh -eu

sudo apt update

sudo apt remove vim-tiny

sudo apt install build-essential
sudo apt install clang
sudo apt install cmake
sudo apt install git
sudo apt install shellcheck
sudo apt install tmux
sudo apt install tree
sudo apt install valgrind
sudo apt install vim-gtk3

sudo apt autoremove
sudo apt autoclean

vi --version

mkdir -p ~/.vim/bundle

if test ! -e ~/.vim/bundle/Vundle.vim
then
  git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
fi

vim -c PluginInstall -c qa

cd ~/.vim/bundle/YouCompleteMe

python3 ./install.py --clangd-completer

