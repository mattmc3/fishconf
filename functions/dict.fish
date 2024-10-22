function __dict_usage
    echo "dict [-h|--help]"
    echo "dict keys [DICTNAME]"
    echo "dict values [DICTNAME]"
    echo "dict get [DICTNAME] [KEY]"
    echo "dict set [DICTNAME] [KEY] [VALUE]"
    echo "dict remove [DICTNAME] [KEY]"
    echo "dict contains [-k|--key] [-v|--value] [-i|--index] [DICTNAME] [STRING]"
end

function __dict_check_dictname -a dictname
    # Check to see that the DICTNAME provided is a valid variable.
    if not set -q -- $dictname
        echo >&2 "dict: Bad DICTNAME. Variable not found: '$dictname'."
        return 2
    end
end

function __dict_contains --no-scope-shadowing
    argparse --name dict --stop-nonopt --exclusive k,v 'k/key' 'v/value' 'i/index' -- $argv
    or return
    set --local -- dictname $argv[1]
    __dict_check_dictname $dictname; or return $status
    set --local -- thedict $$dictname

    set --local start 1
    set --local step 1
    set --local found 0
    if set -q _flag_value
        set start 2
    end
    if set -q _flag_key; or set -q _flag_value
        set step 2
    end

    for idx in (seq $start $step (count $thedict))
        if test $thedict[$idx] = $argv[2]
            if set -q _flag_index
                if set -q _flag_value
                    echo $idx
                else
                    math $idx + 1
                end
            end
            set found 1
        end
    end
    test $found -gt 0; and return 0; or return 1
end

function dict \
    --description "Treat a paired list like a dict" \
    --no-scope-shadowing

    argparse --name dict --ignore-unknown --stop-nonopt 'h/help' -- $argv
    if set -q _flag_help
        __dict_usage; and return 0
    else if test (count $argv) -eq 0
        __dict_usage; and return 1
    end

    set --local subcommand $argv[1]
    set argv $argv[2..]

    # The 'contains' subcommand is more involved so skip it, but for the others we can
    # do this prep logic here.
    set --local thedict
    set --local dictname
    set --local idx

    if test $subcommand != contains
        set -- dictname $argv[1]
        set -- thedict $$dictname
        __dict_check_dictname $dictname; or return $status
    end
    set --local dictsize (count $thedict)

    switch $subcommand
        case keys
            test $dictsize -gt 0; or return 0
            for idx in (seq 1 2 $dictsize)
                echo $thedict[$idx]
            end
        case values
            test $dictsize -gt 0; or return 0
            for idx in (seq 2 2 $dictsize)
                echo $thedict[$idx]
            end
        case get
            test $dictsize -gt 0; or return 1
            set --local key $argv[2]
            for idx in (seq 1 2 $dictsize)
                if test $thedict[$idx] = "$key"
                    echo $thedict[(math $idx + 1)]
                    return 0
                end
            end
            return 1
        case set
            set --local key $argv[2]
            set --local value "$argv[3..]"
            if test $dictsize -eq 0
                set $dictname $key $value
                return 0
            end

            for idx in (seq 1 2 $dictsize)
                if test $thedict[$idx] = "$key"
                    if test $idx -eq 1
                        set $dictname $key $value $thedict[3..]
                    else
                        set $dictname $thedict[1..(math $idx - 1)] $key $value $thedict[(math $idx + 2)..]
                    end
                    return 0
                end
            end
            set $dictname $key $value $thedict
        case remove
            set --local key $argv[2]
            for idx in (seq 1 2 (count $thedict))
                if test $thedict[$idx] = "$key"
                    if test $idx -eq 1
                        set $dictname $thedict[3..]
                    else
                        set $dictname $thedict[1..(math $idx - 1)] $thedict[(math $idx + 2)..]
                    end
                    return 0
                end
            end
            return 1
        case contains
            __dict_contains $argv
            return $status
        case '*'
            echo >&2 "dict: Subcommand not found '$subcommand'."
            return 2
    end
end
