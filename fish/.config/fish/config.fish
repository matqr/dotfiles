## Display
source ~/.profile;clear;
set -xU LSCOLORS gxdxcxdxbxegedabaggxgx
LS >/dev/null

## Paths
set PATH /Users/maqr/miniconda3/bin $PATH
#source "$HOME/miniconda3/etc/fish/conf.d/conda.fish"
status --is-interactive; and source (rbenv init -|psub)
set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths

## Alias
# VIM
alias vim="/usr/local/bin/nvim"
alias oldvim="vim"

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
set -g fish_user_paths "/usr/local/opt/tcl-tk/bin" $fish_user_paths

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
