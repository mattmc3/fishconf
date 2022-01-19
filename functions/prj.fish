function prj --description "Project jump"
    if ! command -v fzf >/dev/null
        echo >&2 "fzf command not found"
        return 1
    end

    # determine the project home
    set -q PROJECTS || set PROJECTS ~/Projects
    set prjlist
    for d in $PROJECTS/**/.git/..
        set -a prjlist (realpath $d)
    end
    set selection (printf "%s\n" $prjlist | sort | fzf --layout=reverse-list --query="$argv")
    if [ -d $PROJECTS/$selection ]
        cd $PROJECTS/$selection
    end
end