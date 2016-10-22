#!/bin/bash

dotfiles=$(cd "$(dirname $0)"; pwd)
cd $dotfiles

if [ ! -e $dotfiles/.fonts ]; then
  git clone https://github.com/edihbrandon/RictyDiminished $dotfiles/.fonts
fi

for f in $dotfiles/.??*
do
  test $f = $dotfiles/.git && continue
  test $f = $dotfiles/.gitignore && continue
  ln -sf "$f" "$HOME"
done

extern="$dotfiles/.vim/extern"
mkdir -p $extern && cd $extern

if [ ! -e $extern/vim-quickrun ]; then
  git clone https://github.com/thinca/vim-quickrun.git $extern/vim-quickrun
fi

ycmdir="$extern/YouCompleteMe"
if [ ! -e $ycmdir ]; then
  git clone https://github.com/Valloric/YouCompleteMe.git $ycmdir
  cd $ycmdir
  git submodule update --init --recursive
  ./install.py --clang-completer
fi

exit 0
