#!/bin/sh

# -- install manually ------------------
# skype, dropbox
# --------------------------------------

apt-get update
apt-get dist-upgrade

apt-get install git

apt-get install rxvt-unicode-256color
apt-get install tmux

apt-get remove vim-tiny
apt-get install vim-nox

apt-get install unity-tweak-tool

# -- Theme and icons ------------------
#  theme: Numix
#  icons: Numix-circle
# --------------------------------------
apt-add-repository ppa:numix/ppa
apt-get update
apt-get install numix-gtk-theme numix-icon-theme-circle


