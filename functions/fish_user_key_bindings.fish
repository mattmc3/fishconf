function fish_user_key_bindings
    # symmetric ctrl-z
    bind \cz 'fg 2>/dev/null; commandline -f repaint'

    # magic-enter
    bind \r magic-enter

    # expand ... to ../..
    bind . expand_dots_to_parent_path
end
