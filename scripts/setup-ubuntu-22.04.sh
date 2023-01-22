#!/bin/sh -eu

sudo apt update

default()
{
  echo build-essential
  echo clang
  echo git
  echo shellcheck
  echo tmux
  echo tree
  echo valgrind
}

optional()
{
  echo libboost-all-dev
}

if test "$#" -eq 0
then
  default | xargs sudo apt install
else
  for each in "$@"
  do
    case "$each" in
      -a | --all      ) ( default && optional ) | xargs sudo apt install --yes ;;
      -d | --default  ) ( default             ) | xargs sudo apt install --yes ;;
      -o | --optional ) (            optional ) | xargs sudo apt install --yes ;;
    esac
  done
fi
