#!/bin/bash

dotfiles=$(cd "$(dirname $0)"; pwd)
cd $dotfiles || exit

for f in .??*
do
  test $f = ".git" && continue
  test $f = ".gitignore" && continue
  unlink $HOME/$f
done
