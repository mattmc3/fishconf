function run_enter_hooks
    set -q ENTER_HOOKS || set -g ENTER_HOOKS
    set -l err 0
    for fn in $ENTER_HOOKS
        if functions -q $fn
            $fn || set err 1
        end
    end
    if test $err -eq 0
        commandline -f execute
    end
end
