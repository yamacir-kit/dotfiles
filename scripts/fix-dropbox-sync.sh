#!/bin/sh

# sudo chattr -R -i "$HOME/Dropbox"
# sudo chown -R "$USER" "$HOME/Dropbox"
# chmod -R u+rw "$HOME/Dropbox"

dropbox stop

sudo sysctl fs.inotify.max_user_watches=1000000
sudo sysctl -p

dropbox start
