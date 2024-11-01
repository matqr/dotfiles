## Display
#source ~/.profile;clear;
set -xU LSCOLORS gxdxcxdxbxegedabaggxgx
LS >/dev/null

## Paths
#source "$HOME/miniconda3/etc/fish/conf.d/conda.fish"
if status is-interactive
    # Add Homebrew to PATH for ARM Macs
    eval (/opt/homebrew/bin/brew shellenv)

    # rbenv
    if type -q rbenv
        rbenv init - fish | source
    end
end

#status --is-interactive; and source (rbenv init -|psub)
set -g fish_user_paths "/opt/homebrew/bin" $fish_user_paths
#set -gx PATH /opt/homebrew/bin/tmux $PATH

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
eval /opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

# Created by `pipx` on 2024-10-30 08:54:07
set PATH $PATH /Users/mquintana/.local/bin
