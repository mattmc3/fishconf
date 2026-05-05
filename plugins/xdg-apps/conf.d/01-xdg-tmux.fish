command -q tmux; or return 1
set -q TMUX_CONFIG; or set -gx TMUX_CONFIG $XDG_CONFIG_HOME/tmux/tmux.conf
