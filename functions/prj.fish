function prj --description "Project jump"
    if ! command -v fzf >/dev/null
        echo >&2 "fzf command not found"
        return 1
    end

    # determine the project home
    set -q MY_PROJECTS || set MY_PROJECTS ~/Projects
    set gitprj $MY_PROJECTS/**/.git/
    set gitprj (path resolve $gitprj/..)

    set prjlist (string replace $MY_PROJECTS/ "" $gitprj)
    set selection (printf '%s\n' $prjlist | sort | fzf --layout=reverse-list --query="$argv")
    if test -d $MY_PROJECTS/$selection
        cd $MY_PROJECTS/$selection
    else
        echo $MY_PROJECTS/$selection
    end
end
