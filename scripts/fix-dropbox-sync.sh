#!/bin/sh

sudo chattr -R -i "$HOME/Dropbox"
sudo chown -R "$USER" "$HOME/Dropbox"
chmod -R u+rw "$HOME/Dropbox"

