type -q screen; or return 1
set -q SCREENRC; or set -gx SCREENRC $XDG_CONFIG_HOME/screen/screenrc
set -q SCREENDIR; or set -gx SCREENDIR $XDG_RUNTIME_DIR/screen
