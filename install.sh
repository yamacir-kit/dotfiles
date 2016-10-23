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

mkdir -p $dotfiles/.vim/bundle || exit

if [ ! -e $dotfiles/.vim/bundle/vundle ]; then
  git clone https://github.com/gmarik/vundle.git $dotfiles/.vim/bundle/vundle
fi

echo "[info] Finished."
echo "[next] 1) Run ex command :PluginInstall on Vim."
echo "       2) Run shell script dotfiles/scripts/install_vimycm.sh"

exit 0
