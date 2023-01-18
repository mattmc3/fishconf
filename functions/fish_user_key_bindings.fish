function fish_user_key_bindings
    # symmetric ctrl-z
    bind \cz 'fg 2>/dev/null; commandline -f repaint'
end
