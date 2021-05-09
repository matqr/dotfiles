#!/bin/bash

# 1. Install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# 2. Clone necessary plugins.
git clone git://github.com/zsh-users/zsh-autosuggestions oh-my-zsh/.oh-my-zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search oh-my-zsh/.oh-my-zsh/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git oh-my-zsh/.oh-my-zsh/plugins/zsh-syntax-highlighting

# 3. Add plugins to ~/.zshrc as
#plugins = ( [plugins...] zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting)
#Note: make sure zsh-syntax-highlighting is the last one in the above list.

# 4. Fix background theme issues (Not necessary depends on your theme)
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=white'
