function pj --description "Project jump"
    if ! command -v fzf >/dev/null
        echo "fzf command not found" >&2
        return 1
    end

    # determine the project home
    set -q PROJECTS || set PROJECTS ~/Projects
    if [ (count $argv) -lt 1 ]
        set projectdir $PROJECTS
    else
        set projectdir $argv[1]
    end

    set prjlist
    for d in $PROJECTS/**/.git/
        set prjlist $prjlist (string replace -a -r '('$PROJECTS'/)|(/\.git/$)' '' $d)
    end
    set selection (echo $prjlist | tr ' ' '\n' | sort | fzf --layout=reverse-list)
    if [ -d $PROJECTS/$selection ]
        cd $PROJECTS/$selection
    end
end
