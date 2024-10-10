#!/bin/sh

brew update

brew install cmake python vim

bundle=$(dirname "$0")/../.vim/bundle

mkdir -p "$bundle"

if test ! -e "$bundle/Vundle.vim"
then
  git clone https://github.com/VundleVim/Vundle.vim "$bundle/Vundle.vim"
fi

vi -c PluginInstall -c qa

cd $bundle/YouCompleteMe

python3 ./install.py --clangd-completer
