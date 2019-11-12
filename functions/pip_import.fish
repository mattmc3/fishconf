function pip_import --description 'Import pip requirements'
    if not count $argv >/dev/null
        set argv "requirements.txt"
    end
    if not test -f "$argv"
        echo "Usage: Expecting valid requirements.txt path: $argv" >&2
        return
    end
    pip install -r "$argv"
end
