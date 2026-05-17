#!/usr/bin/env bash

set -e          # Exit on error
set -o pipefail # Exit on pipe error
set -x          # Enable verbosity

# Dont link DS_Store files
find . -name ".DS_Store" -exec rm {} \;

# install dependencies
brew install lua
brew install ripgrep
brew install fd
brew install tree-sitter
brew install fzf
brew install neovim
brew install tmux
brew install --cask font-hack-nerd-font

# Install fisher and fish plugins
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher update

# install conda
brew install --cask miniforge
conda init fish

PROGRAMS=(stow bash git condarc nvim ssh fish alacritty tmux aerospace)

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
backup_if_exists ~/.condarc
backup_if_exists ~/.ssh

for program in ${PROGRAMS[@]}; do
  stow -v $program
  echo "Configuring $program"
done

# Fix fzf fish symlink
rm -f ~/.config/fish/functions/fzf_key_bindings.fish
ln -s $(brew --prefix fzf)/shell/key-bindings.fish ~/.config/fish/functions/fzf_key_bindings.fish

echo "Done!"
