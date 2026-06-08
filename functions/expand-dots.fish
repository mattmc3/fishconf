function expand-dots --description 'expand .... to ../.. etc (4+ dots)'
    set -l buf (commandline --cut-at-cursor)

    # bail if cursor is inside an unclosed quote
    set -l squotes (string replace -ar '[^\']' '' -- $buf | string length)
    set -l dquotes (string replace -ar '[^"]' '' -- $buf | string length)
    if test (math $squotes % 2) -ne 0; or test (math $dquotes % 2) -ne 0
        commandline -i .
        return
    end

    set -l dots (string match -rg '(\.+)$' -- $buf)
    set -l n (string length -- "$dots")

    if test "$n" -ge 3
        set -l parts
        for i in (seq (math $n - 1))
            set -a parts ..
        end
        for i in (seq $n)
            commandline -f backward-delete-char
        end
        commandline -i (string join / $parts)
    else if string match -qr '\.\.(/\.\.)+$' -- $buf
        commandline -i /..
    else
        commandline -i .
    end
end
