#!/bin/bash -eux

current_directory=$(dirname "$0")

dotfiles=$(cd "$current_directory/.."; pwd)

# sudo apt-add-repository -y ppa:jonathonf/vim
# sudo apt update

sudo apt install -y vim-gnome build-essential cmake python3-dev

bundle=$dotfiles/.vim/bundle

mkdir -p "$bundle"
if test ! -e "$bundle/Vundle.vim"
then
  git clone https://github.com/VundleVim/Vundle.vim.git "$bundle/Vundle.vim"
fi

vi -c PluginInstall -c qa

python3 "$bundle/YouCompleteMe/install.py" --clangd-completer

sudo apt remove -y vim-tiny

