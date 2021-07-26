#!/bin/sh -eu

here=$(cd "$(dirname "$0")"; pwd)

cd "$here"

for f in .??*
do
  test "$f" = .git && continue
  test "$f" = .github && continue
  test "$f" = .gitignore && continue
  unlink "$HOME/$f"
done
