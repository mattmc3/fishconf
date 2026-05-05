function magic-enter-cmd --description "Print the command to run when no command was given"
    test "$MAGIC_ENTER_ENABLED" -eq 1 || return 1
    set -l cmd ls
    if command git rev-parse --is-inside-work-tree &>/dev/null
        set cmd "git status -sb"
    end
    echo $cmd
end
