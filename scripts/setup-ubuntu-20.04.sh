#!/bin/sh -eux

install_develop_libraries()
{
  sudo apt install -y libboost-all-dev
  sudo apt install -y libcairo2-dev
  sudo apt install -y libgmp-dev
  sudo apt install -y libx11-dev
  sudo apt install -y libxext-dev
  sudo apt install -y libxft-dev
}

install_develop_tools()
{
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

  sudo snap install scc
}

install_documentation_tools()
{
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
}

install_gnome_utilities()
{
  sudo apt install -y gnome-calculator
  sudo apt install -y gnome-characters
  sudo apt install -y gnome-logs
  sudo apt install -y gnome-system-monitor
  sudo apt install -y gnome-tweak-tool
  sudo apt install -y numix-gtk-theme
  sudo apt install -y numix-icon-theme-circle
}

install_miscellaenous_tools()
{
  sudo apt install -y gimp
  sudo apt install -y iftop
  sudo apt install -y indicator-cpufreq
  sudo apt install -y inkscape
  sudo apt install -y ppa-purge
  sudo apt install -y python3-gpg # for dropbox
}

install_multimedia_tools()
{
  sudo apt install -y ffmpeg
  sudo apt install -y ubuntu-restricted-extras
}

install_develop_libraries
install_develop_tools
install_documentation_tools
install_gnome_utilities
install_miscellaenous_tools
install_multimedia_tools
