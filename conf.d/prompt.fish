#
# Prompt
#

# Disable new user greeting.
set fish_greeting

# Initialize starship.
if type -q starship
    set -gx STARSHIP_CONFIG $__fish_config_dir/themes/starship.toml
    source_cache starship_init.fish starship init fish --print-full-init
    enable_transience

    # Start prompt at the bottom
    # tput cup 9999 0
end

fish_set_cursor bar
