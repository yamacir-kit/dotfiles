#!/bin/bash

for f in $(pwd)/.??*
do
  test "$f" = "$(pwd)/.git" && continue
  test "$f" = "$(pwd)/.gitignore" && continue
  ln -sf "$f" "$HOME"
done

# if [ ! -e /etc/X11/xorg.conf.d ]; then
#   mkdir /etc/X11/xorg.conf.d
# fi
# ln -sf ../50-synaptics.conf /etc/X11/xorg.conf.d/50-synaptics.conf

exit 0
