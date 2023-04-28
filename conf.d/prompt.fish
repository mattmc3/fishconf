set -q FISH_PROMPT_THEME || set -U FISH_PROMPT_THEME hydro

switch $FISH_PROMPT_THEME
case hydro
    set -g hydro_symbol_prompt "❱"
    set -g hydro_symbol_git_dirty "*"
    set -g hydro_symbol_git_ahead "⇡"
    set -g hydro_symbol_git_behind "⇣"
    # set -g hydro_pre_prompt "\n"

    set -g hydro_color_git magenta
    set -g hydro_color_prompt blue
    set -g hydro_color_pwd green
    set -g hydro_color_error red
    # set -g hydro_multiline true
    set -g fish_prompt_pwd_dir_length 1

case starship
    set -gx STARSHIP_CONFIG $__fish_config_dir/themes/prompt/zebrafish.toml
    starship init fish | source
end
