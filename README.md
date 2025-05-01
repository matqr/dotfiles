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
- yabai

Clone into `~/.dotfiles`

**Note**: For `stow` remember to use the same folder structure the destination files would be.
E.g. `config.fish` should be place in `~/.config/fish/`, thus this same folder structure is used in the repo.

For aliases in fish, copy them into `config/fish`

Lots of stuff copied over from [ThePrimeagen](https://github.com/awesome-streamers/awesome-streamerrc/tree/master/ThePrimeagen).

# [Yabai](https://github.com/koekeishiya/yabai) (tile manager)
Content copied from [here](https://www.josean.com/posts/yabai-setup).
For switching spaces (Mission conrol), replace the shortcuts for `opt+number` as it is more comfortable.

## Requirements
- Disable SIP
- Configure [scripting addition](https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release))

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
