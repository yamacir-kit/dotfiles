#!/bin/sh -eu

here=$(cd "$(dirname "$0")"; pwd)

for f in "$here"/.??*
do
  test "$f" = "$here"/.git && continue
  test "$f" = "$here"/.github && continue
  test "$f" = "$here"/.gitignore && continue
  ln -sf "$f" "$HOME"
done

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
