#!/bin/bash

dotfiles=$(cd "$(dirname $0)"; pwd)

if [ ! -e $dotfiles/.fonts ]; then
  git clone https://github.com/edihbrandon/RictyDiminished $dotfiles/.fonts
fi

for f in $dotfiles/.??*
do
  test $f = $dotfiles/.git && continue
  test $f = $dotfiles/.gitignore && continue
  ln -sf $f $HOME
done

mkdir -p $dotfiles/bundle || exit

if [ ! -e $dotfiles/bundle/vundle ]; then
  git clone https://github.com/gmarik/vundle.git $dotfiles/bundle/vundle
fi

# ycmdir="$extern/YouCompleteMe"
# if [ ! -e $ycmdir ]
# then
#   git clone https://github.com/Valloric/YouCompleteMe.git $ycmdir
# 
#   cd $ycmdir
#   git submodule update --init --recursive
#   python2 ./install.py --clang-completer --system-libclang
# 
#   cd $ycmdir/third_party/ycmd/cpp/ycm
#   ln -sf $dotfiles/.vim/config/.ycm_extra_conf.py
# fi

exit 0
