#!/bin/bash

set -e 			# Exit on error
set -o pipefail # Exit on pipe error
set -x 			# Enable verbosity

# Install oh-my-fish
#curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish

# Install oh-my-fish agnoster package
#omf install agnoster

# Install fish
arch -arm64 brew install fish

# Install powerline fonts
git clone https://github.com/powerline/fonts.git ~/Git/powerline-fonts
~/Git/powerline-fonts/./install.sh
rm -rf ~/Git/powerline-fonts

# Add shell to /etc/shells
command -v fish | sudo tee -a /etc/shells

# Change default shell to fish
chsh -s /opt/homebrew/bin/fish

