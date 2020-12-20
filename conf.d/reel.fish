# ~/.config/fish/conf.d/reel.fish

# make the reel function available
contains ~/.config/fish/plugins/mattmc3/reel/functions $fish_function_path
or set fish_function_path ~/.config/fish/plugins/mattmc3/reel/functions $fish_function_path

# store your plugins in a fish_plugins variable for ease
set fish_plugins \
    "decors/fish-colored-man" \
    "edc/bass" \
    "fishingline/cd-ls" \
    "fishingline/common-funcs" \
    "jethrokuan/z" \
    "fishingline/gitdot" \
    "fishingline/macos" \
    "fishingline/python" \
    "fishingline/safe-rm" \
    # "fishingline/sorin-prompt-enhanced" \
    "fishingline/up" \
    "laughedelic/fish_logo" \
    "rafaelrinaldi/pure"

# reel in (clone+load) your plugins
reel in $fish_plugins
