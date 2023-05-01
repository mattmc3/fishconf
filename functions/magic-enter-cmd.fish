function magic-enter-cmd -d "Print the command to run when no command was given"
    set -l cmd ls
    if command git rev-parse --is-inside-work-tree &>/dev/null
        set cmd "git status -sb"
    end
    echo $cmd
end
