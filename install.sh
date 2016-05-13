#!/bin/bash
if [ $PWD != $HOME/.vim ]; then
  echo "This should be in $HOME/.vim!"
  exit 1
fi
cp -i .vimrc ~/
