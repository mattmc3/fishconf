#
# Prompt
#

# Disable new user greeting.
set fish_greeting

# Initialize starship.
type -q starship || return 1
set -q STARSHIP_CONFIG; or set -gx STARSHIP_CONFIG $__fish_config_dir/themes/mmc.toml
cachecmd starship init fish | source
enable_transience
