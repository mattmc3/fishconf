type -q rustup; or return 1
set -q RUSTUP_HOME; or set -gx RUSTUP_HOME $XDG_DATA_HOME/rustup
