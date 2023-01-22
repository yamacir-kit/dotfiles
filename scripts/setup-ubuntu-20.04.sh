#!/bin/sh -eux

sudo apt update

default()
{
  # develop libraries
  echo libboost-all-dev
  echo libcairo2-dev
  echo libgmp-dev
  echo libx11-dev
  echo libxext-dev
  echo libxft-dev

  # develop tools
  echo build-essential
  echo clang
  echo cloc
  echo cmake
  echo doxygen
  echo git
  echo git-lfs
  echo shellcheck
  echo sloccount
  echo tmux
  echo tree
  echo valgrind

  # documentation tools
  echo gnuplot
  echo graphviz
  echo gv
  echo latexmk
  echo pstoedit
  echo texlive
  echo texlive-fonts-extra
  echo texlive-fonts-recommended
  echo texlive-lang-japanese
  echo xdvik-ja

  # gnome utilities
  echo gnome-calculator
  echo gnome-characters
  echo gnome-logs
  echo gnome-system-monitor
  echo gnome-tweak-tool
  echo numix-gtk-theme
  echo numix-icon-theme-circle

  # miscellaneous
  echo gimp
  echo iftop
  echo indicator-cpufreq
  echo inkscape
  echo ppa-purge
  echo python3-gpg # for dropbox

  # multimedia
  echo ffmpeg
  echo ubuntu-restricted-extras
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
