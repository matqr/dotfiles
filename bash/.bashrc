# Environment setup
if [ -f ~/.env ]; then
    source ~/.env
fi

# ALIASES
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export LANG=en_US

# added by Anaconda3 5.2.0 installer
export PATH="/Users/matias/anaconda3/bin:$PATH"

# added by Miniconda3 installer
export PATH="/Users/matias/miniconda3/bin:$PATH"

