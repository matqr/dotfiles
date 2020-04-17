source ~/.profile;clear;
set -xU LSCOLORS gxdxcxdxbxegedabaggxgx
LS >/dev/null
set PATH /Users/matias/miniconda3/bin $PATH
source "$HOME/miniconda3/etc/fish/conf.d/conda.fish"
status --is-interactive; and source (rbenv init -|psub)
set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths
