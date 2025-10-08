function add_enter_hook
    set -q ENTER_HOOKS || set -g ENTER_HOOKS
    for fn in $argv
        # only add if function exists and isn't already in the list
        if functions -q $fn
            if not contains -- $fn $ENTER_HOOKS
                set -ga ENTER_HOOKS $fn
            end
        else
            echo "add_enter_hook: function '$fn' not found" >&2
        end
    end
end
