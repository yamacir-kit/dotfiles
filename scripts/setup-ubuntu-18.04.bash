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
  graphviz \
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
  chrome-gnome-shell \
  gimp \
  gnome-shell-extension-pixelsaver \
  indicator-cpufreq \
  inkscape \
"

# gnome
packages="$packages \
  gnome-shell-extensions \
  gnome-tweak-tool \
  gnome-usage \
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
  ttf-mscorefonts-installer \
"

sudo apt install -y $packages

# sudo add-apt-repository ppa:vantuz/cool-retro-term
# sudo apt update
# sudo apt install cool-retro-term

