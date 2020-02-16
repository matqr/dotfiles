source ~/.profile;clear;
set -gx LSCOLORS gxdxcxdxbxegedabaggxgx
LS >/dev/null
neofetch
set PATH /Users/matias/miniconda3/bin $PATH
source /Users/matias/miniconda3/etc/fish/conf.d/conda.fish
status --is-interactive; and source (rbenv init -|psub)
set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths
