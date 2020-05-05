#!/bin/bash -eux

sudo apt-add-repository -y ppa:numix/ppa
sudo apt update

sudo snap remove gnome-calculator \
                 gnome-characters \
                 gnome-logs \
                 gnome-system-monitor

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

# gnome
packages="$packages \
  gnome-calculator \
  gnome-characters \
  gnome-logs \
  gnome-shell-extension-pixelsaver \
  gnome-shell-extensions \
  gnome-system-monitor
  gnome-tweak-tool \
  gnome-usage \
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

