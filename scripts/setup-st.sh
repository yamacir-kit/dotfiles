#!/bin/sh -eu

sudo apt update

sudo apt install libx11-dev libxft-dev

git clone https://git.suckless.org/st

cd st

sudo make install
