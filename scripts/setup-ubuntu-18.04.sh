#!/bin/bash -eux

sudo apt-add-repository -y ppa:numix/ppa
sudo apt update

sudo snap remove gnome-calculator \
                 gnome-characters \
                 gnome-logs \
                 gnome-system-monitor

packages=''

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
  libx11-dev \
  libxcb-keysyms1-dev \
  libxcb-xtest0 \
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
# NOTE: python3-gpg for dropbox
packages="$packages \
  gimp \
  iftop \
  indicator-cpufreq \
  inkscape \
  ppa-purge \
  python3-gpg \
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
  gnome-shell-extension-pixelsaver \
  gnome-shell-extensions \
  gnome-system-monitor
  gnome-tweak-tool \
  numix-gtk-theme \
  numix-icon-theme-circle \
  numix-icon-theme-square \
"

sudo apt install -y "$packages"
