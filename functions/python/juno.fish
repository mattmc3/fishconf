function juno --description 'Open a Jupyter notebook'
    set -q XDG_PROJECTS_DIR || set -Ux XDG_PROJECTS_DIR $HOME/Projects
    set -q JUPYTER_PROJECTS_DIR || set -Ux JUPYTER_PROJECTS_DIR $XDG_PROJECTS_DIR/jupyter
    test -d $JUPYTER_PROJECTS_DIR || mkdir -p $JUPYTER_PROJECTS_DIR

    if test -d "$argv[1]"
        cd $argv[1]
    else
        cd $JUPYTER_PROJECTS_DIR
    end
    jupyter notebook
end
