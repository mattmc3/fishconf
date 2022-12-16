function mkvenv -d 'Create a new Python venv'
    # put all venvs in $VENV_HOME
    set argv[-1] "$VENV_HOME"/"$argv[-1]"
    python3 -m venv $argv
end
