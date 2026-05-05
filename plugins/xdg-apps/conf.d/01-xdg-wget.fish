command -q wget; or return 1
set -q WGETRC; or set -gx WGETRC $XDG_CONFIG_HOME/wgetrc
