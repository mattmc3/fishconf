function __prerun_dispatch --description "Fire prerun events before a command executes"
    set -g __prerun_cancel 0
    emit prerun
    if test "$__prerun_cancel" = 1
        commandline -f repaint
        return
    end
    commandline -f execute
end
