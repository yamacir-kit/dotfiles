#!/bin/sh -eu

sudo apt update

sudo apt install software-properties-common # for apt-add-repository

sudo apt-add-repository -y ppa:jonathonf/vim

sudo apt update

sudo apt install -y build-essential cmake python3-dev vim-gtk3

sudo apt remove -y vim-tiny

bundle=$(dirname "$0")/../.vim/bundle

mkdir -p "$bundle"

if test ! -e "$bundle/Vundle.vim"
then
  git clone https://github.com/altercation/vim-colors-solarized "$bundle/vim-colors-solarized" # HACK: To fix error "Cannot find color scheme 'solarized'".
  git clone https://github.com/VundleVim/Vundle.vim "$bundle/Vundle.vim"
fi

vi -c PluginInstall -c qa

cd $bundle/YouCompleteMe

python3 ./install.py --clangd-completer
