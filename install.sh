#!/bin/sh -eu

dotfiles=$(cd "$(dirname "$0")"; pwd)

for f in "$dotfiles"/.??*
do
  test "$f" = "$dotfiles"/.git && continue
  test "$f" = "$dotfiles"/.gitignore && continue
  ln -sf "$f" "$HOME"
done
