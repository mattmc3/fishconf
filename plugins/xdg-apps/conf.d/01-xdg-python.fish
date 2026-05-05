type -q python3; or return 1
set -q WORKON_HOME; or set -gx WORKON_HOME $XDG_DATA_HOME/venvs
set -q PYLINTHOME; or set -gx PYLINTHOME $XDG_CACHE_HOME/pylint
set -q IPYTHONDIR; or set -gx IPYTHONDIR $XDG_CONFIG_HOME/ipython
set -q PYTHON_HISTORY; or set -gx PYTHON_HISTORY $XDG_STATE_HOME/python_history
