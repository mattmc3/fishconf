function clipcopy --description 'Copy data to clipboard'
    set --local ostype (uname -s)
    if test "$ostype" = Darwin
        if test (count $argv) -eq 0
            cat /dev/stdin | pbcopy
        else
            cat $argv | pbcopy
        end
    else
        echo >&2 "Unsupported OS '$ostype'."
    end
end
