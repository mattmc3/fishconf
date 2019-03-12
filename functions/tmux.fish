function tmux --description 'alias tmux=tmux -f "\$XDG_CONFIG_HOME"/tmux/tmux.conf'
	command tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf $argv;
end
