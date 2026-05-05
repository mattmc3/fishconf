type -q duckdb; or return 1
set -q DUCKDB_HISTORY; or set -gx DUCKDB_HISTORY $XDG_STATE_HOME/duckdb/history
mkdir -p $XDG_STATE_HOME/duckdb
