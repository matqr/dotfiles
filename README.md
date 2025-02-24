Custom configuration files for
- alias
- fish
- ssh
- tmux
- alacritty
- bash
- git
- conda
- nvim
- stow
- vim

Clone into `~/.dotfiles`

**Note**: For `stow` remember to use the same folder structure the destination files would be.
E.g. `config.fish` should be place in `~/.config/fish/`, thus this same folder structure is used in the repo.

For aliases in fish, copy them into `config/fish`

Lots of stuff copied over from [ThePrimeagen](https://github.com/awesome-streamers/awesome-streamerrc/tree/master/ThePrimeagen)

# Tips

Run `tmux` automatically when `fish` starts.
Add the following file in `~/.config/fish/conf.d/tmux.fish

```
if not set -q TMUX
    set -g TMUX tmux new-session -d -s base
    eval $TMUX
    tmux attach-session -d -t base
end
```
