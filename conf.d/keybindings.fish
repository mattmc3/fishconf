# Keybindings and interactive line-editing behavior.

set --global fish_key_bindings fish_default_key_bindings

# fancy-ctrl-z: press ctrl-z again to resume the last backgrounded job.
bind \cz 'fg 2>/dev/null; commandline -f repaint'

# copybuffer: ctrl-o copies the current command line to the clipboard.
bind \co copybuffer
