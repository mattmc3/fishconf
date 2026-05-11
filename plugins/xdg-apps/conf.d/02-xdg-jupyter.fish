type -q jupyter; or return 1
set -q JUPYTER_CONFIG_DIR; or set -gx JUPYTER_CONFIG_DIR $XDG_CONFIG_HOME/jupyter
