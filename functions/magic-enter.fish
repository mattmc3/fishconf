function magic-enter -d 'Press return to run a default command'
    set -l cmd (commandline)
    if test -z "$cmd"
        commandline -r (magic-enter-cmd)
        commandline -f suppress-autosuggestion
    end

    if test (count $MAGIC_ENTER_SHADOWED_BINDS) -gt 0
        set -l other
        for other in $MAGIC_ENTER_SHADOWED_BINDS
            $other
        end
    else
        commandline -f execute
    end
end
