function activate --description 'Python venv activation' --argument venv
    if test (count $venv) -eq 0
        set activate_file ./.venv/bin/activate.fish
    else
        set activate_file "$VENV_HOME/$venv"/bin/activate.fish
    end

    if not [ -f $activate_file ]
        echo "Missing venv activate file: $activate_file" >&2
        return 1
    end
    source "$activate_file"
end
