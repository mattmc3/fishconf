# Defined in - @ line 1
function tmux --description 'alias tmux command tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf'
    command tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf $argv;
end
