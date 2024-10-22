function fish_user_key_bindings
    # symmetric ctrl-z
    bind \cz 'fg 2>/dev/null; commandline -f repaint'

    # magic-enter
    set --global MAGIC_ENTER_SHADOWED_BINDS (bind | string match -rg '^bind \\\\r (.+)$')
    bind \r magic-enter

    # ctrl-k to colorize
    bind \ck colorize_hex

    # expand ... to ../..
    bind . expand_dots_to_parent_path
end
