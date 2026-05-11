type -q less; or return 1
set -q LESSKEY; or set -gx LESSKEY $XDG_CONFIG_HOME/lesskey
set -q LESSHISTFILE; or set -gx LESSHISTFILE $XDG_STATE_HOME/lesshst
