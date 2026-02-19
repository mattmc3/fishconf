function touchf --description 'Make parent dirs and touch a file'
    if test (count $argv) -ne 1
        echo >&2 "touchf: expected 1 argument"
        return 1
    end
    test -f $argv[1] && return 0
    mkdir -p (path dirname $argv[1]) && touch $argv[1]
end
