function brew \
    --description 'Wrap brew with sudo for multi-user systems' \
    --wraps='brew'

    if not test -d $HOMEBREW_PREFIX
        echo >&2 "Homebrew not initialized. Run 'brew shellenv'."
    end

    # If the brew path is owned by another user, wrap it so brew commands
    # are executed as the brew owner.
    set --local brew_owner (stat -f "%Su" $HOMEBREW_PREFIX)
    if test $brew_owner != (whoami) && test "$argv" != shellenv
        sudo -Hu $brew_owner $HOMEBREW_PREFIX/bin/brew $argv
    else
        $HOMEBREW_PREFIX/bin/brew $argv
    end
end
