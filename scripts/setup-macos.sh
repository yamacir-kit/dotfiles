#!/bin/sh

brew update

brew install cmake
brew install google-chrome
brew install python
brew install shellcheck
brew install tmux
brew install vim

mkdir -p ~/.vim/bundle

if test ! -e ~/.vim/bundle/Vundle.vim
then
  git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
fi

vi -c PluginInstall -c qa

cd ~/.vim/bundle/YouCompleteMe

python3 ./install.py --clangd-completer
