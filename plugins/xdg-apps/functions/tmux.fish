if command -q tmux
    function tmux
        command tmux -f $TMUX_CONFIG $argv
    end
end
