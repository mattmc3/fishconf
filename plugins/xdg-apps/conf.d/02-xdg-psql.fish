type -q psql; or return 1
set -q PSQLRC; or set -gx PSQLRC $XDG_CONFIG_HOME/pg/psqlrc
set -q PSQL_HISTORY; or set -gx PSQL_HISTORY $XDG_STATE_HOME/pg/psql_history
set -q PGPASSFILE; or set -gx PGPASSFILE $XDG_CONFIG_HOME/pg/pgpass
set -q PGSERVICEFILE; or set -gx PGSERVICEFILE $XDG_CONFIG_HOME/pg/pg_service.conf
mkdir -p $XDG_STATE_HOME/pg
