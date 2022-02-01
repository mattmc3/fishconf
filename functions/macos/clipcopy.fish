function clipcopy -d 'Copy file or stream to clipboard'
    if test -f "$argv"
        cat "$argv" | pbcopy
    else
        pbcopy
    end
end
