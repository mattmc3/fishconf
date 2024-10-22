# make sure we have a default home for venvs
set -q WORKON_HOME || set -gx WORKON_HOME $XDG_DATA_HOME/venvs
test -d $WORKON_HOME || mkdir -p $WORKON_HOME

# python
set -gx PYLINTHOME $XDG_CACHE_HOME/pylint
set -gx WORKON_HOME $XDG_DATA_HOME/venvs
