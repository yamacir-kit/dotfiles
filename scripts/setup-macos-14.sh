#!/bin/sh

brew update

brew install tmux google-chrome

default()
{
  echo google-chrome
  echo tmux
}

optional()
{
  echo gmp
  echo shellcheck
}

if test "$#" -eq 0
then
  default | xargs brew install
else
  for each in "$@"
  do
    case "$each" in
      -a | --all      ) ( default && optional ) | xargs brew install ;;
      -d | --default  ) ( default             ) | xargs brew install ;;
      -o | --optional ) (            optional ) | xargs brew install ;;
    esac
  done
fi

