#!/bin/sh
# create linkers to dotfiles

# directry
DOTFILES=~/Dropbox/dotfiles
FONTS=~/Dropbox/.fonts

ln -sf ${DOTFILES}/.bashrc ~/.bashrc
ln -sf ${DOTFILES}/.dircolors ~/.dircolors
ln -sf ${DOTFILES}/.gitconfig ~/.gitconfig
ln -sf ${DOTFILES}/.inputrc ~/.inputrc
ln -sf ${DOTFILES}/.latexmkrc ~/.latexmkrc
ln -sf ${DOTFILES}/.tmux.conf ~/.tmux.conf
ln -sf ${DOTFILES}/.vim ~/.vim
ln -sf ${DOTFILES}/.vimrc ~/.vimrc
ln -sf ${DOTFILES}/.Xdefaults ~/.Xdefaults

ln -sf ${FONTS} ~/.fonts

#if [ ! -e /etc/X11/xorg.conf.d ]; then
#  mkdir /etc/X11/xorg.conf.d
#fi
#ln -sf ../50-synaptics.conf /etc/X11/xorg.conf.d/50-synaptics.conf
