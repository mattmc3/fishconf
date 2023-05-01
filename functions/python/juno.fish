function juno --description 'Open a Jupyter notebook'
    set -q MY_PROJECTS || set -gx MY_PROJECTS $HOME/Projects
    set -q JUPYTER_PROJECTS_DIR || set -gx JUPYTER_PROJECTS_DIR $MY_PROJECTS/jupyter
    test -d $JUPYTER_PROJECTS_DIR || mkdir -p $JUPYTER_PROJECTS_DIR

    if test -d "$argv[1]"
        cd $argv[1]
    else
        cd $JUPYTER_PROJECTS_DIR
    end
    jupyter notebook
end
