# set -q _hydro_initialized && exit || set -g _hydro_initialized true
set -g hydro_symbol_prompt "»"
set -g hydro_symbol_git_dirty "*"
set -g hydro_symbol_git_ahead "⇡"
set -g hydro_symbol_git_behind "⇣"
set -g hydro_pre_prompt "\n"

set -g hydro_color_git green
set -g hydro_color_prompt cyan
set -g hydro_color_pwd blue
set -g hydro_color_error red
set -g hydro_multiline true
set -g fish_prompt_pwd_dir_length -1
