function juno --description 'Open Jupyter Lab'
    set -q WORKON_HOME || set -l WORKON_HOME $XDG_DATA_HOME/venvs
    set -q MY_PROJECTS || set -l MY_PROJECTS $HOME/Projects

    set -l juno_venv $WORKON_HOME/juno
    if not test -d $juno_venv
        python3 -m venv $juno_venv || return 1
        $juno_venv/bin/pip install --upgrade pip
        $juno_venv/bin/pip install jupyterlab pandas || begin
            rm -rf $juno_venv
            return 1
        end
    end

    set -l jupyter_prj $MY_PROJECTS/mattmc3/jupyter
    if not test -d $jupyter_prj
        git clone git@github.com:mattmc3/jupyter $jupyter_prj || return 1
    end

    set -l target $jupyter_prj
    set -q argv[1] && set target $argv[1]

    $juno_venv/bin/jupyter lab $target
end
