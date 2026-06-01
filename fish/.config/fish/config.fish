## Display
#source ~/.profile;clear;
set -xU LSCOLORS gxdxcxdxbxegedabaggxgx
LS >/dev/null

## Paths
if status is-interactive
    # Add Homebrew to PATH for ARM Macs
    eval (/opt/homebrew/bin/brew shellenv)

    # rbenv
    if type -q rbenv
        rbenv init - fish | source
    end
end

set -gx PATH $HOME/miniforge3/bin $PATH
set -g fish_user_paths "/opt/homebrew/bin" $fish_user_paths

## Alias
# VIM
alias vim="/opt/homebrew/bin/nvim"
alias oldvim="vim"

# tmux
#alias tmux='/opt/homebrew/bin/tmux'

# Git
alias gal='git add --all'
alias ga='git add'
alias gs='git status'
alias gc='git commit -m'
alias gu='git pull'
alias gg='git graph'
alias gb='git branch'
alias gp='git push'
# unalias gd
alias gd='git diff'
alias gD='git ls-files'
 # Note that gs is also ghostscript
alias ghostscript="/usr/local/bin/gs"

# Jupyter
alias jc="jupyter console"
alias jl="jupyter lab"
alias jco="jupyter nbconvert"
alias jn="jupyter notebook"
alias jn-b="jupyter notebook --no-browser"

# No greeting when starting an interactive shell.
function fish_greeting
end


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/Caskroom/miniforge/base/bin/conda
    eval /opt/homebrew/Caskroom/miniforge/base/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/opt/homebrew/Caskroom/miniforge/base/etc/fish/conf.d/conda.fish"
        . "/opt/homebrew/Caskroom/miniforge/base/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/opt/homebrew/Caskroom/miniforge/base/bin" $PATH
    end
end
# <<< conda initialize <<<

export PATH="$HOME/.local/bin:$PATH"
