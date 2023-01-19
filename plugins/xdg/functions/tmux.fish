function tmux --wraps='tmux' --description 'alias tmux command tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf'
    command tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf $argv
end
