function freshen \
    --argument-names funcname \
    --description 'Reload a function\'s source'

    if test (count $argv) -ne 1
        echo >&2 "freshen: expected 1 argument, got $(count $argv)"
        return 2
    end

    function __freshen_file
        echo "Sourcing $argv..."
        source $argv
    end

    # see if we can find the file where a function was defined
    set --local fnfile $(functions --details $argv)
    if test -f $fnfile
        __freshen_file $fnfile && return
    end

    # if not, see if we can find that file name
    for dir in $fish_function_path
        set --local fnfile "$dir/$argv.fish"
        if test -f $fnfile
            __freshen_file $fnfile && return
        end
    end

    echo >&2 "Cannot find function file for arg: '$argv'."
    return 1
end
