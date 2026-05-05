type -q nim; or return 1
set -q NIMBLE_DIR; or set -gx NIMBLE_DIR $XDG_DATA_HOME/nimble
