#!/bin/bash

for f in $(pwd)/.??*
do
  test "$f" = "$(pwd)/.git" && continue
  test "$f" = "$(pwd)/.gitignore" && continue
  ln -sf "$f" "$HOME"
done

exit 0
