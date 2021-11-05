if test "$pure_prompt_initialized" != true
    set -U pure_prompt_initialized true
    set -U pure_symbol_prompt "»"
    set -U pure_symbol_reverse_prompt "«"
    set -U pure_color_success cyan
    set -U pure_color_info magenta
    set -U pure_color_git_dirty magenta
end
