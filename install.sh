#!/bin/bash

for f in $(pwd)/.??*
do
  test "$f" = "$(pwd)/.git" && continue
  test "$f" = "$(pwd)/.gitignore" && continue
  ln -sf "$f" "$HOME"
done

mkdir -p .vim/extern
cd .vim/extern
git clone https://github.com/tomasr/molokai
git clone https://github.com/thinca/vim-quickrun
cd -

git clone https://github.com/edihbrandon/RictyDiminished .fonts

exit 0
