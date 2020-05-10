#!/bin/bash -eux

sudo apt-add-repository -y ppa:numix/ppa
sudo apt update

sudo snap remove gnome-calculator \
                 gnome-characters \
                 gnome-logs \
                 gnome-system-monitor

# Develop
packages="$packages \
  build-essential \
  clang \
  cmake \
  doxygen \
  git \
  git-lfs \
  shellcheck \
  sloccount \
  tmux \
  tree \
  valgrind \
"

# Library
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

# Documentation
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
  ppa-purge \
"

# Codecs
packages="$packages \
  ffmpeg \
  ubuntu-restricted-extras \
"

# Gnome
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

# Fonts
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

