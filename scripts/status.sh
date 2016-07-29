#!/bin/bash

cd `tmux display-message -p -F "#{pane_current_path}"`

if git status &> /dev/null; then
  echo -e "$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')($(git status -s | wc -l)) ";
else
  echo "not a git repository";
fi
