# Environment setup
set fish_greeting # no start up message

# Aliases (if using fish shell copy them over fish_aliases)
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Default editor for remaining programs
export EDITOR='nvim'
export VISUAL='nvim'

# added by Anaconda3 5.2.0 installer
export PATH="~/anaconda3/bin:$PATH"

# added by Miniconda3 installer
#/Users/matias
export PATH="~/miniconda3/bin:$PATH"

