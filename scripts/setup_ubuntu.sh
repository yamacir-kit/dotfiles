#!/bin/bash

scripts=$(cd "$(dirname $0)"; pwd)
dotfiles="$scripts/.."

libpkgs="clang-4.0"
devpkgs="build-essential clang cmake git llvm python-dev python-flake8 python3-dev"
devenvs="rxvt-unicode-256color tmux"
texpkgs="dvipsk-ja gv latexmk pstoedit texlive texlive-fonts-extra texlive-fonts-recommended texlive-lang-cjk xdvik-ja"

sudo apt-get update && sudo apt-get dist-upgrade
sudo apt-get -y install $libpkgs
sudo apt-get -y install $devpkgs
sudo apt-get -y install $devenvs
sudo apt-get -y install $texpkgs

sudo apt-get -y install inkscape

# source $dotfiles/install.sh


# -- Theme and icons -------------------------------------------
#  theme: Numix
#  icons: Numix-circle
# --------------------------------------------------------------
sudo apt-add-repository -y ppa:numix/ppa
sudo apt-get update && sudo apt-get -y install numix-gtk-theme numix-icon-theme-circle
sudo apt-get -y install unity-tweak-tool


# -- Google Chrome ---------------------------------------------
# wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
# sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
# sudo apt-get update && sudo apt-get -y install google-chrome-stable


# -- Vim -------------------------------------------------------
sudo apt-get -y remove vim-tiny
sudo apt-add-repository -y ppa:jonathonf/vim
sudo apt-get update && sudo apt-get install -y vim-gnome

# -- Compilers -------------------------------------------------
sudo add-apt-repository -y ppa:jonathonf/gcc-7.1
sudo apt update && sudo apt install -y gcc-7 g++-7

