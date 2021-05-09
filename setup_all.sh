#!/usr/bin/env bash

# set -e          # Exit on error
# set -o pipefail # Exit on pipe error
# set -x          # Enable verbosity

# Dont link DS_Store files
find . -name ".DS_Store" -exec rm {} \;

PROGRAMS=(alias bash git stow vim nvim ssh fish zsh oh-my-zsh alacritty tmux)

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
backup_if_exists ~/.bash_profile
backup_if_exists ~/.bashrc
backup_if_exists ~/.config/fish/config.fish
backup_if_exists ~/.zsh
backup_if_exists ~/.oh-my-zsh
backup_if_exists ~/.vimrc
backup_if_exists ~/.ssh
backup_if_exists ~/.alias
backup_if_exists ~/.config/alacritty/alacritty.yml

for program in ${PROGRAMS[@]}; do
  stow -v $program
  echo "Configuring $program"
done

echo "Done!"
