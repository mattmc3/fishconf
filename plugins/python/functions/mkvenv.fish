function mkvenv -d 'Create a new Python venv'
    if not set -q WORKON_HOME && test (count $argv) -gt 0
        echo >&2 '$WORKON_HOME not set.'
        return 1
    end

    set -gx VIRTUAL_ENV
    if test (count $argv) -eq 0
        set VIRTUAL_ENV $PWD/.venv
    else if string match -q '*/*' $argv
        set VIRTUAL_ENV $argv
    else if set -q WORKON_HOME
        set VIRTUAL_ENV $WORKON_HOME/$argv
    else
        echo >&2 'Python venv cannot be created. Make sure $WORKON_HOME is set.'
        return 1
    end

    if test -d $VIRTUAL_ENV
        echo >&2 "Python venv already exists '$VIRTUAL_ENV'."
        return 1
    end

    python3 -m venv $VIRTUAL_ENV
    set --local ext
    for ext in '' '.fish'
        touch $VIRTUAL_ENV"/envvars"$ext
        echo 'source $VIRTUAL_ENV/envvars'$ext >>"$VIRTUAL_ENV/bin/activate"$ext
    end
    source $VIRTUAL_ENV/bin/activate.fish
end
