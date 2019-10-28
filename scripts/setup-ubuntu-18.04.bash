#!/bin/bash -eux

scripts=$(cd "$(dirname $0)/.."; pwd)

sudo apt-add-repository -y ppa:numix/ppa
sudo apt update

# command
packages="\
  tree \
"

# develop
packages="$packages \
  build-essential \
  clang \
  cmake \
  doxygen \
  g++ \
  gcc \
  git \
  git-lfs \
  tmux \
"

# library
packages="$packages \
  libboost-all-dev \
  libcairo2-dev \
  libgmp-dev \
  libmpfr-dev \
  libx11-dev \
  libxcb-keysyms1-dev \
  libxcbdev \
  libxext-dev \
  libxft-dev \
"

# documentation
packages="$packages \
  gnuplot \
  gv \
  latexmk \
  pstoedit \
  texlive \
  texlive-fonts-extra \
  texlive-fonts-recommended \
  texlive-lang-cjk \
  xdvik-ja \
"

# miscellaenous
packages="$packages \
  gimp \
  indicator-cpufreq \
  inkscape \
"

# numix
packages="$packages \
  gnome-tweak-tool \
  numix-gtk-theme \
  numix-icon-theme-circle \
  numix-icon-theme-square \
"

# fonts
package="$packages \
  fonts-firacode \
  fonts-noto-cjk \
  fonts-noto-cjk-extra \
  fonts-noto-color-emoji \
  fonts-noto-mono \
"

sudo apt install -y $packages

