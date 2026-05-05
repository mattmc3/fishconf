type -q redis-cli; or return 1
set -q REDISCLI_HISTFILE; or set -gx REDISCLI_HISTFILE $XDG_DATA_HOME/redis/rediscli_history
set -q REDISCLI_RCFILE; or set -gx REDISCLI_RCFILE $XDG_CONFIG_HOME/redis/redisclirc
mkdir -p $XDG_DATA_HOME/redis
