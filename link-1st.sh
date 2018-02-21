#!/bin/bash
#-------------#
# Define Vars #
#-------------#
DOTFILE_DIR=$(cd $(dirname $0);pwd)

#-------------#
# MAIN SCRIPT #
#-------------#
for filepath in $DOTFILE_DIR/.??*
do
  filename="${filepath##*/}"
  # ignore file & dir
  # git manage dir 
  [[ "$filename" == ".git" ]] && continue
  [[ "$filename" == ".gitignore" ]] && continue
  [[ "$filename" =~ \.swp$ ]] && continue

  # create symlink
  if [[ -e $HOME/$filename ]]
  then
    echo Already exist $filename
  else
    echo create link $filename
    ln -s $filepath $HOME/$filename
  fi

done

