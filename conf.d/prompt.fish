# hydro
# # hydro prompt vars
# set -g hydro_symbol_prompt "❱"
# #set -g hydro_symbol_git_dirty "*"
# set -g hydro_symbol_git_ahead "⇡"
# set -g hydro_symbol_git_behind "⇣"
# # set -g hydro_pre_prompt "\n"

# set -g hydro_color_git brmagenta
# set -g hydro_color_prompt green
# set -g hydro_color_pwd cyan
# set -g hydro_color_error red
# set -g hydro_color_duration yellow
# # set -g hydro_multiline true
# set -g fish_prompt_pwd_dir_length 1

# starship
set -gx STARSHIP_CONFIG $__fish_config_dir/themes/hydro.toml
source (starship init fish --print-full-init | psub)
