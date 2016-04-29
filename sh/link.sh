#!/bin/sh
# create linkers to dotfiles

ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.dircolors ~/.dircolors
ln -sf ~/dotfiles/.fonts ~/.fonts
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.inputrc ~/.inputrc
ln -sf ~/dotfiles/.latexmkrc ~/.latexmkrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.vim ~/.vim
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.Xdefaults ~/.Xdefaults

if [ ! -e /etc/X11/xorg.conf.d ]; then
  mkdir /etc/X11/xorg.conf.d
fi

ln -sf ~/dotfiles/50-synaptics.conf /etc/X11/xorg.conf.d/50-synaptics.conf

