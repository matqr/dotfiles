#!/usr/bin/env bash

# set -e          # Exit on error
# set -o pipefail # Exit on pipe error
# set -x          # Enable verbosity

# Dont link DS_Store files
find . -name ".DS_Store" -exec rm {} \;

PROGRAMS=(alias keybinding git stow vim)

function backup_if_exists() {
    if [ -f $1 ];
    then
      mv $1 "$1.bk"
    fi
    if [ -d $1 ];
    then
      mv $1 "$1.bk"
    fi
}

# Clean common conflicts
backup_if_exists ~/.vimrc
backup_if_exists ~/.aliases

for program in ${PROGRAMS[@]}; do
  stow -v $program
  echo "Configuring $program"
done

echo "Done!"

echo "Launching aliases"
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi
