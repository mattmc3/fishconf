function reload --description 'Reload a fish function from its file'
    if test (count $argv) -ne 1
        echo "Usage: reload <function_name>"
        return 1
    end

    set fn $argv[1]
    set path $__fish_config_dir/functions/$fn.fish

    if not test -f $path
        echo "Function file not found: $path"
        return 1
    end

    if functions -q $fn
        functions --erase $fn
    end

    source $path
    echo "Reloaded function '$fn' from $path"
end
