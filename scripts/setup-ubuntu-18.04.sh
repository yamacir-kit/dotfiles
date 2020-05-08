#!/bin/bash -eux

sudo apt-add-repository -y ppa:numix/ppa
sudo apt update

sudo snap remove gnome-calculator \
                 gnome-characters \
                 gnome-logs \
                 gnome-system-monitor

# command
packages="\
  sloccount \
  tree \
"

# develop
packages="$packages \
  build-essential \
  clang \
  cmake \
  doxygen \
  git \
  git-lfs \
  shellcheck \
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
  libxcb1-dev \
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
  texlive-lang-japanese \
  xdvik-ja \
"

# miscellaenous
packages="$packages \
  gimp \
  indicator-cpufreq \
  inkscape \
"

# Codecs
packages="$packages \
  ffmpeg \
  ubuntu-restricted-extras \
"

# gnome
packages="$packages \
  gnome-calculator \
  gnome-characters \
  gnome-logs \
  gnome-mahjongg \
  gnome-shell-extension-pixelsaver \
  gnome-shell-extensions \
  gnome-sudoku \
  gnome-system-monitor
  gnome-tweak-tool \
  numix-gtk-theme \
  numix-icon-theme-circle \
  numix-icon-theme-square \
"

# fonts
packages="$packages \
  fonts-firacode \
  fonts-noto-cjk \
  fonts-noto-cjk-extra \
  fonts-noto-color-emoji \
  fonts-noto-mono \
  ttf-mscorefonts-installer \
"

sudo apt install -y "$packages"

# sudo apt-add-repository ppa:noobslab/themes
# sudo add-apt-repository ppa:noobslab/icons
#
# sudo apt update
# sudo apt install arc-theme arc-icons

