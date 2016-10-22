#!/bin/bash

CURRENT_PATH=$(tmux display-message -p -F "#{pane_current_path}")

cd $CURRENT_PATH

BRANCH_NAME=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
CHANGES_COUNT=$(git status -s | wc -l)

if git status &> /dev/null; then
  echo -e "$BRANCH_NAME($CHANGES_COUNT)";
else
  echo "not a git repository";
fi
