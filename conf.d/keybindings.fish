# Keybindings and interactive line-editing behavior.

set --global fish_key_bindings fish_default_key_bindings

# expand-dots: typing ... expands to ../.. (each extra dot adds another level up).
bind . expand-dots

# fancy-ctrl-z: press ctrl-z again to resume the last backgrounded job.
bind \cz 'fg 2>/dev/null; commandline -f repaint'
