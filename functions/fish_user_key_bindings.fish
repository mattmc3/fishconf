function fish_user_key_bindings
    # Use emacs
    fish_default_key_bindings

    # symmetric ctrl-z
    bind \cz 'fg 2>/dev/null; commandline -f repaint'

    # ctrl-k to colorize
    bind \ck colorize_hex

    # expand ... to ../..
    bind . expand_dots_to_parent_path

    # add default enter actions
    add_enter_hook magic-enter

    # bind enter to wrapper
    bind \r run_enter_hooks
end
