#!/bin/bash

if test -z $1
then
  echo "arguments error"
  exit 1
fi

src=$(echo $1 | sed -e "s/\.[^.]*$//g")
inkscape -z --export-area-page --file=$src.svg --export-eps=$src.eps

