#!/bin/bash

dotfiles=$(cd "$(dirname $0)/.."; pwd)

python2 $dotfiles/.vim/bundle/YouCompleteMe/install.py --clang-completer --system-libclang
# python2 $dotfiles/.vim/bundle/YouCompleteMe/install.py --all --system-libclang
