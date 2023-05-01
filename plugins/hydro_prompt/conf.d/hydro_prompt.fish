set -q hydro_symbol_prompt || set -g hydro_symbol_prompt "❱"
set -q hydro_symbol_git_dirt || set -g hydro_symbol_git_dirty "*"
set -q hydro_symbol_git_ahead || set -g hydro_symbol_git_ahead "⇡"
set -q hydro_symbol_git_behind || set -g hydro_symbol_git_behind "⇣"
# set -q hydro_pre_prompt || set -g hydro_pre_prompt "\n"

set -q hydro_color_git || set -g hydro_color_git brcyan
set -q hydro_color_prompt || set -g hydro_color_prompt blue
set -q hydro_color_pwd || set -g hydro_color_pwd green
set -q hydro_color_error || set -g hydro_color_error red
set -q hydro_color_duration || set -g hydro_color_duration yellow
# set -q hydro_multiline || set -g hydro_multiline true
set -q fish_prompt_pwd_dir_length || set -g fish_prompt_pwd_dir_length 1
