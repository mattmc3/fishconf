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
