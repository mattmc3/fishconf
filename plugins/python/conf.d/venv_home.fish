if not set -q VENV_HOME
    if set -q XDG_DATA_HOME
        set -gx VENV_HOME $XDG_DATA_HOME/venvs
    else
        set -gx VENV_HOME ~/.local/share/venvs
    end
end
test -d $VENV_HOME || mkdir -p "$VENV_HOME"

# python
set -gx PYLINTHOME $XDG_CACHE_HOME/pylint
set -gx WORKON_HOME $XDG_DATA_HOME/venvs
