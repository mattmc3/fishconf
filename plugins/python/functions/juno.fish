function juno --description 'Open a Jupyter notebook'
    if test -d $argv[1]
        cd $argv[1]
    else
        if not set -q JUPYTER_PROJECTS_DIR
            if set -q XDG_PROJECT_HOME
                set -gx JUPYTER_PROJECTS_DIR $XDG_PROJECTS_DIR/jupyter
            else
                set -gx JUPYTER_PROJECTS_DIR $HOME/Projects/jupyter
            end
        end
        test -d $JUPYTER_PROJECTS_DIR || mkdir -p $JUPYTER_PROJECTS_HOME
        cd $JUPYTER_PROJECTS_DIR
    end
    jupyter notebook
end
