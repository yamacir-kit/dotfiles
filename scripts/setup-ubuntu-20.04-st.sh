#!/bin/sh -eu

dotfiles=$(cd "$(dirname "$0")/.."; pwd)

sudo apt update

sudo apt install libx11-dev libxft-dev

git clone https://git.suckless.org/st "$dotfiles"/st

cd "$dotfiles"/st

git apply "$dotfiles"/scripts/st.patch

sudo make install
