set -gx STARSHIP_CONFIG $__fish_config_dir/themes/prompt/zebrafish.toml
starship init fish | source

# set -q _hydro_initialized && exit || set -g _hydro_initialized true
# set -g hydro_symbol_prompt "»"
# set -g hydro_symbol_git_dirty "*"
# set -g hydro_symbol_git_ahead "⇡"
# set -g hydro_symbol_git_behind "⇣"
# # set -g hydro_pre_prompt "\n"

# set -g hydro_color_git green
# set -g hydro_color_prompt cyan
# set -g hydro_color_pwd blue
# set -g hydro_color_error red
# # set -g hydro_multiline true
# set -g fish_prompt_pwd_dir_length 1

# set -gx STARSHIP_CONFIG $XDG_CONFIG_HOME/starship/fish.toml
# starship init fish | source
