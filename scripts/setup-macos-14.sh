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
}

if test "$#" -eq 0
then
  default | xargs brew install
else
  for each in "$@"
  do
    case "$each" in
      -a | --all      ) ( default && optional ) | xargs sudo brew install ;;
      -d | --default  ) ( default             ) | xargs sudo brew install ;;
      -o | --optional ) (            optional ) | xargs sudo brew install ;;
    esac
  done
fi

