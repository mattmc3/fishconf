function __init__events --description 'Setup event dispatch + Enter binding'
    function __prerun_dispatch --description 'Fire prerun events before a command executes'
        set -g __prerun_cancel 0
        emit prerun
        if test "$__prerun_cancel" = 1
            commandline -f repaint
            return
        end
        commandline -f execute
    end

    if test "$fish_key_bindings" = fish_vi_key_bindings
        bind -M insert  \r __prerun_dispatch
        bind -M default \r __prerun_dispatch
    else
        bind \r __prerun_dispatch
    end
end
