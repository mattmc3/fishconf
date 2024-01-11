function tmux --wraps='tmux' --description 'alias tmux command tmux -f $TMUXHOME/tmux.conf'
    set -q TMUXHOME; or set -gx TMUXHOME $XDG_CONFIG_HOME/tmux
    test -d $TMUXHOME; or mkdir -p $TMUXHOME
    test -e $TMUXHOME/tmux.conf; or touch $TMUXHOME/tmux.conf
    command tmux -f $TMUXHOME/tmux.conf $argv
end
