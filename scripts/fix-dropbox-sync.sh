#!/bin/sh

# sudo chattr -R -i "$HOME/Dropbox"
# sudo chown -R "$USER" "$HOME/Dropbox"
# chmod -R u+rw "$HOME/Dropbox"

sudo sysctl fs.inotify.max_user_watches=100000
sudo sysctl -p
