#
# Prompt
#

# Disable new user greeting.
set fish_greeting

# Initialize starship.
if type -q starship
    set -gx STARSHIP_CONFIG $__fish_config_dir/themes/starship.toml
    if not test -r $__fish_cache_dir/starship_init.fish
        starship init fish --print-full-init >$__fish_cache_dir/starship_init.fish
    end
    source $__fish_cache_dir/starship_init.fish
    enable_transience

    # Start prompt at the bottom
    # tput cup 9999 0
end

fish_set_cursor bar
