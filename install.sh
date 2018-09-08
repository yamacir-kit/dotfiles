#!/bin/bash -eu

dotfiles=$(cd "$(dirname $0)"; pwd)

for f in $dotfiles/.??*
do
  test $f = $dotfiles/.git && continue
  test $f = $dotfiles/.gitignore && continue
  ln -sf $f $HOME
done

# if [ ! -e $dotfiles/.vim/bundle/Vundle.vim ];
# then
#   mkdir -p $dotfiles/.vim/bundle
#   git clone https://github.com/VundleVim/Vundle.vim.git $dotfiles/.vim/bundle/Vundle.vim
# fi
#
# vi -c PluginInstall -c qa

