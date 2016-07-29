#!/bin/bash

for f in .??*
do
  test "$f" = ".git" && continue
  test "$f" = ".gitignore" && continue
  unlink "$HOME/$f"
done
