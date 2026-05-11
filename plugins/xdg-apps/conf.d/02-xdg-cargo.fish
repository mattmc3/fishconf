type -q cargo; or return 1
set -q CARGO_HOME; or set -gx CARGO_HOME $XDG_DATA_HOME/cargo
