#!/bin/bash -eux

# sudo apt-add-repository -y ppa:numix/ppa
# sudo apt update

sudo snap remove gnome-calculator
sudo snap remove gnome-characters
sudo snap remove gnome-logs
sudo snap remove gnome-system-monitor

# Develop
sudo apt install -y build-essential
sudo apt install -y clang
sudo apt install -y cloc
sudo apt install -y cmake
sudo apt install -y doxygen
sudo apt install -y git
sudo apt install -y git-lfs
sudo apt install -y shellcheck
sudo apt install -y sloccount
sudo apt install -y tmux
sudo apt install -y tree
sudo apt install -y valgrind

# Library
sudo apt install -y libboost-all-dev
sudo apt install -y libcairo2-dev
sudo apt install -y libgmp-dev
sudo apt install -y libx11-dev
sudo apt install -y libxcb-*
sudo apt install -y libxext-dev
sudo apt install -y libxft-dev

# Documentation
sudo apt install -y gnuplot
sudo apt install -y graphviz
sudo apt install -y gv
sudo apt install -y latexmk
sudo apt install -y pstoedit
sudo apt install -y texlive
sudo apt install -y texlive-fonts-extra
sudo apt install -y texlive-fonts-recommended
sudo apt install -y texlive-lang-japanese
sudo apt install -y xdvik-ja

# Miscellaenous
sudo apt install -y gimp
sudo apt install -y iftop
sudo apt install -y indicator-cpufreq
sudo apt install -y inkscape
sudo apt install -y ppa-purge
sudo apt install -y python3-gpg # for dropbox

# Codecs
sudo apt install -y ffmpeg
sudo apt install -y ubuntu-restricted-extras

# Gnome
sudo apt install -y gnome-calculator
sudo apt install -y gnome-characters
sudo apt install -y gnome-logs
sudo apt install -y gnome-system-monitor
sudo apt install -y gnome-tweak-tool
sudo apt install -y numix-gtk-theme
