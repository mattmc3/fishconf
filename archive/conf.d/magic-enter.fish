function magic-enter-cmd
    set -l cmd
    switch (uname)
        case Darwin
            set cmd ls -FG
        case *
            set cmd ls
    end
    if command git rev-parse --is-inside-work-tree &>/dev/null
        set cmd "$cmd && git status -s"
    end
    eval $cmd
    commandline -f execute
end

function magic-enter
    set -l cmd (commandline)
    if test -z "$cmd"
        magic-enter-cmd
    end
    commandline -f execute
end

bind \r magic-enter
