# Function to ensure Homebrew is in PATH
function ensure_homebrew_path
    if not contains /opt/homebrew/bin $PATH
        eval (/opt/homebrew/bin/brew shellenv)
    end
end

if status is-interactive
    # Ensure Homebrew is in PATH before checking for tmux
    ensure_homebrew_path

    if type -q tmux
        if not set -q TMUX
            if not tmux has-session 2>/dev/null
                tmux new-session -d
            end
            exec tmux attach
        end
    end
end
