#!/bin/bash

current_path=$(tmux display-message -p -F "#{pane_current_path}")

cd $current_path

branch_name=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
changes_count=$(git status -s | wc -l)

if git status &> /dev/null
then
  echo -e "$branch_name($changes_count)";
else
  echo "not a git repository";
fi
