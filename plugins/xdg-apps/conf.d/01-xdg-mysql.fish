type -q mysql; or return 1
set -q MYSQL_HISTFILE; or set -gx MYSQL_HISTFILE $XDG_DATA_HOME/mysql_history
