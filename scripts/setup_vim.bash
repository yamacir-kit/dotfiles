#!/bin/bash

# TODO デバッグしていないので次回実行時は手動テスト推奨

dotfiles=$(cd "$(dirname $0)/.."; pwd)

sudo apt-add-repository -y ppa:jonathonf/vim
sudo apt update
sudo apt install -y vim-gtk
sudo apt remove -y vim-tiny

bundle=$dotfiles/.vim/bundle

mkdir -p $bundle
[ ! -e $bundle/Vundle.vim ] && git clone https://github.com/VundleVim/Vundle.vim.git $bundle/Vundle.vim

vi -c PluginInstall -c qa

python2 $bundle/YouCompleteMe/install.py --clang-completer --system-libclang

