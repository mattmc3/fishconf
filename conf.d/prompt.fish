if test "$my_prompt_initialized" != true
    set -g my_prompt_initialized true
    set -g hydro_symbol_prompt "»"
    set -g hydro_symbol_git_dirty "*"
    set -g hydro_symbol_git_ahead "⇡"
    set -g hydro_symbol_git_behind "⇣"

    set hydro_color_git green
    set hydro_color_prompt cyan
    set hydro_color_pwd blue
    set hydro_color_error red
end
