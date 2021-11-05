# modify pure prompt to display fail code
# https://github.com/pure-fish/pure/issues/188
# https://github.com/pure-fish/pure/blob/master/functions/fish_prompt.fish
function fish_prompt
    set --local exit_code $status # save previous exit code

    echo -e -n (_pure_prompt_beginning) # init prompt context (clear current line, etc.)
    # add an additional newline if not compact prompt
    test "$pure_enable_single_line_prompt" = true || echo
    _pure_print_prompt_rows # manage default vs. compact prompt
    _pure_place_iterm2_prompt_mark # place iTerm shell integration mark
    # show the exit_code from the prior command
    if test $exit_code -ne 0
        echo -e -n (set_color red)$exit_code(set_color normal)
    end
    echo -e -n (_pure_prompt $exit_code) # print prompt
    echo -e (_pure_prompt_ending) # reset colors and end prompt

    set _pure_fresh_session false
end
