function prj --description "Project jumper"
    if not command -q fzf
        echo >&2 "prj: fzf command not found. Install with your OS package manager."
        return 1
    end

    # determine the project home
    set -q MY_PROJECTS || set -l MY_PROJECTS ~/Projects
    set -l prjfolders (path dirname $MY_PROJECTS/**/.git)

    # use fzf to navigate to a project
    set -l prjlist (string replace $MY_PROJECTS/ "" $prjfolders)
    set -l selection (printf '%s\n' $prjlist | sort | fzf --layout=reverse-list --query="$argv")
    test $status -eq 0 || return $status
    echo "Navigating to '$selection'."
    cd $MY_PROJECTS/$selection
end
