#!/bin/bash

scripts=$(cd "$(dirname $0)"; pwd)
dotfiles="$scripts/.."

libpkgs="libclang-3.8-dev"
devpkgs="git build-essentiali python-dev python3-dev clang"
devenvs="rxvt-unicode-256colorl tmux"
texpkgs="texlive texlive-lang-cjk xdvik-ja dvipsk-ja gv texlive-fonts-recommended texlive-fonts-extra latexmk"
others="skype dropbox"

sudo apt-get update && sudo apt-get dist-upgrade
sudo apt-get -y install $libpkgs $devpkgs $devenvs $texpkgs $others

source $dotfiles/install.sh


# -- Theme and icons -------------------------------------------
#  theme: Numix
#  icons: Numix-circle
# --------------------------------------------------------------
sudo apt-add-repository -y ppa:numix/ppa && apt-get update
sudo apt-get -y install numix-gtk-theme numix-icon-theme-circle unity-tweak-tool


# -- Google Chrome ---------------------------------------------
sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update && sudo apt-get -y install google-chrome-stable


# -- Vim -------------------------------------------------------
sudo apt-get -y remove vim-tiny
sudo apt-add-repository -y ppa:jonathonf/vim
sudo apt-get update && sudo apt-get install -y vim-gnome
