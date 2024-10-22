#
# Prompt
#

# Disable new user greeting.
set fish_greeting

# Initialize starship.
type -q starship || return 1
set -gx STARSHIP_CONFIG $__fish_config_dir/themes/mmc.toml
starship init fish | source
enable_transience

# Initialize hydro
# set -g hydro_symbol_prompt "❱"
# #set -g hydro_symbol_git_dirty "*"
# set -g hydro_symbol_git_ahead "⇡"
# set -g hydro_symbol_git_behind "⇣"
# # set -g hydro_pre_prompt "\n"

# set -g hydro_color_git green
# set -g hydro_color_prompt brmagenta
# set -g hydro_color_pwd blue
# set -g hydro_color_error red
# set -g hydro_color_duration yellow
# # set -g hydro_multiline true
# set -g fish_prompt_pwd_dir_length 1
