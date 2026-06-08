# Functions fired on the `prerun` event.
function __prerun_dispatch --description 'Fire prerun events before a command executes'
    set -g __prerun_cancel 0
    emit prerun
    if test "$__prerun_cancel" = 1
        commandline -f repaint
        return
    end
    commandline -f execute
end

# Bind enter to prerun
if test "$fish_key_bindings" = fish_vi_key_bindings
    bind -M insert  \r __prerun_dispatch
    bind -M default \r __prerun_dispatch
else
    bind \r __prerun_dispatch
end

# magic-enter: run a default command when Enter is pressed on an empty line.
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

# strip-dollar-prefix: strip a leading "$ " when pasting copied shell commands.
function strip_dollar_prefix --on-event prerun
    set -l cmd (commandline)
    if string match -qr '(^|\n)\$ ' -- $cmd
        commandline -r -- (string replace -ar '(^|\n)\$ ' '$1' -- $cmd)
    end
end
