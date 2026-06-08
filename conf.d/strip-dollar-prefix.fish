# Strip a leading "$ " when pasting copied shell commands.
function strip_dollar_prefix --on-event prerun
    set -l cmd (commandline)
    if string match -qr '(^|\n)\$ ' -- $cmd
        commandline -r -- (string replace -ar '(^|\n)\$ ' '$1' -- $cmd)
    end
end
