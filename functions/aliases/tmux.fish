# Defined via `source`
function tmux --wraps='command tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf' --description 'alias tmux command tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf'
    command tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf $argv
end
