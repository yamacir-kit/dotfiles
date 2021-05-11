#!/bin/sh -e

dotfiles=$(cd "$(dirname "$0")"; pwd)

cd "$dotfiles"

for f in .??*
do
  test "$f" = ".git" && continue
  test "$f" = ".gitignore" && continue
  unlink "$HOME/$f"
done
