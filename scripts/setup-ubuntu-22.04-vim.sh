#!/bin/sh -eu

dotfiles=$(cd "$(dirname "$0")/.."; pwd)

sudo apt update
sudo apt install build-essential gettext git libacl1-dev libgpm-dev libtinfo-dev libxmu-dev libxpm-dev # https://vim-jp.org/docs/build_linux.html
sudo apt remove vim-tiny
sudo apt autoremove
sudo apt autoclean

vim=$dotfiles/vim

if test ! -d "$vim"
then
  git clone https://github.com/vim/vim.git "$vim"
  cd "$vim"
else
  cd "$vim"
  if test -d "$vim/Makefile"
  then
    make uninstall
    make clean
    git clean -fdx
    git pull
  fi
fi

./configure \
  --enable-multibyte \
  --enable-python3interp \
  --with-features=huge \
  --with-x \

make -j

sudo make install

sudo update-alternatives --install "/usr/bin/vim" "vim" "/usr/local/bin/vim" 1
sudo update-alternatives --install "/usr/bin/vi"  "vi"  "/usr/local/bin/vim" 1
sudo update-alternatives --config vim
sudo update-alternatives --config vi

vim --version

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
