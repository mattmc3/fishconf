function workon --description 'Python venv activation'
    set -l activate_file "$VENV_HOME/$argv"/bin/activate.fish
    if not [ -f $activate_file ]
        echo "Missing venv activate file: $activate_file" >&2
        return 1
    end
    source "$activate_file"
end
