# Run a default command when Enter is pressed on an empty line.
function magic-enter --on-event prerun
    set -l cmd (commandline)
    if test -z "$cmd"; and functions -q magic-enter-cmd
        if set -l default_cmd (magic-enter-cmd)
            commandline -r $default_cmd
            commandline -f suppress-autosuggestion
        end
    end
    commandline -f execute
end

if not functions -q magic-enter-cmd
    function magic-enter-cmd --description "Print the command to run when no command was given"
        switch "$MAGIC_ENTER_ENABLED"
        case '1' 'true' 'yes' 'on'
        case '*'
            return 1
        end
        set -l cmd ls
        if command git rev-parse --is-inside-work-tree &>/dev/null
            set cmd "git status -sb"
        end
        echo $cmd
    end
end
