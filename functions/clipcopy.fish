function clipcopy --description 'Copy data to clipboard'
    argparse --name=clipcopy p/path -- $argv; or return 1

    set --local ostype (uname -s | string lower)
    if test "$ostype" != darwin
        echo >&2 "Unsupported OS '$ostype'."
        return 1
    end

    if set -q _flag_path
        set --local target $argv[1]
        test -n "$target"; or set target $PWD
        path resolve $target | pbcopy
    else if test (count $argv) -eq 0
        cat /dev/stdin | pbcopy
    else
        cat $argv | pbcopy
    end
end
