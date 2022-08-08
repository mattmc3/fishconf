function juno --description 'Open a Jupyter notebook'
    if test -d "$argv[1]"
        cd "$argv[1]"
    else
        if not set -q JUPYTER_HOME
            if set -q XDG_PROJECT_HOME
                set -g JUPYTER_HOME $XDG_PROJECTS_DIR/jupyter
            else
                set -g JUPYTER_HOME $HOME/Projects/jupyter
            end
        end
        test -d $JUPYTER_HOME || mkdir -p $JUPYTER_HOME
        cd $JUPYTER_HOME
    end
    jupyter notebook
end
