function workon --description 'Python venv activation'
    if not set -q WORKON_HOME && test (count $argv) -gt 0
        echo >&2 '$WORKON_HOME not set.'
        return 1
    end

    set -gx VIRTUAL_ENV
    if test (count $argv) -eq 0
        set VIRTUAL_ENV $PWD/.venv
    else if string match -q '*/*' $argv
        set VIRTUAL_ENV $argv
    else
        set VIRTUAL_ENV $WORKON_HOME/$argv
    end

    set --local activate_file $VIRTUAL_ENV/bin/activate.fish
    if not test -f $activate_file
        echo "Missing venv activate file: $activate_file" >&2
        return 1
    end
    source "$activate_file"
end
