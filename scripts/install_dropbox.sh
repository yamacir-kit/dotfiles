#!/bin/bash

scripts=$(cd "$(dirname $0)"; pwd)
dotfiles="$scripts/.."

sudo apt-get install -y nautilus-dropbox
dropbox start -i
