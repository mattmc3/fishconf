type -q sqlite3; or return 1
set -q SQLITE_HISTORY; or set -gx SQLITE_HISTORY $XDG_STATE_HOME/sqlite_history
