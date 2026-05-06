function __init__ --description 'Dispatch to __init__<subcommand> functions'
    if test (count $argv) -eq 0
        for f in $fish_function_path/__init__*.fish
            test -f $f; or continue
            set -l sub (path basename -- $f | string replace -r '\.fish$' '' | string sub -s 9)
            test -n "$sub"; or continue
            set -l desc (head -n1 $f | string match -gr -- "--description ['\"]([^'\"]+)['\"]" | head -n1)
            printf '%s\t%s\n' $sub $desc
        end | sort -u
        return 0
    end

    set -l subcmd $argv[1]
    set -e argv[1]
    set -l fn __init__$subcmd

    if not functions -q $fn
        echo "__init__: unknown subcommand: $subcmd" >&2
        return 1
    end

    $fn $argv
end
