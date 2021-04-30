#!/usr/bin/env bash

# set -e          # Exit on error
# set -o pipefail # Exit on pipe error
# set -x          # Enable verbosity

# Dont link DS_Store files
find . -name ".DS_Store" -exec rm {} \;

PROGRAMS=(alias keybinding git stow vim nvim)

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

# Install some basic programs
add-apt-repository ppa:neovim-ppa/stable
apt-get update
apt-get install neovim
apt-get install vim
apt-get install neofetch
apt-get install ncdu

# Clean common conflicts
backup_if_exists ~/.vimrc
backup_if_exists ~/.aliases
backup_if_exists ~/.inputrc
backup_if_exists ~/.gitignore_global

for program in ${PROGRAMS[@]}; do
  stow -v $program
  echo "Configuring $program"
done

echo "Done!"

if [ -f ~/.aliases ]; then
  echo "Launching aliases"
  source ~/.aliases
fi
