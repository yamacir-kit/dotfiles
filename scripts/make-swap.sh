#!/bin/bash -e

name="/tmp/swap"

sudo fallocate -l "$@" $name # sudo fallocate -l 8G /swap
sudo chmod 600 $name
sudo mkswap $name
sudo swapon $name

free -h

