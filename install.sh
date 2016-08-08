#!/bin/bash

for f in $(pwd)/.??*
do
  test "$f" = "$(pwd)/.git" && continue
  test "$f" = "$(pwd)/.gitignore" && continue
  ln -sf "$f" "$HOME"
done

cd .vim/extern/
git clone https://github.com/tomasr/molokai
git clone https://github.com/thinca/vim-quickrun
cd -

exit 0
