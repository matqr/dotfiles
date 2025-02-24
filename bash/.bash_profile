# Some OSes like Ubuntu/Mac expect bash_profile
# Redirect to bashrc
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/mquintana/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/mquintana/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/mquintana/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/mquintana/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

. "$HOME/.local/bin/env"
