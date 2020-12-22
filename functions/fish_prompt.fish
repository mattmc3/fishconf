function fish_prompt
    set --local exit_code $status # save previous exit code

    echo -e -n (_pure_prompt_beginning) # init prompt context (clear current line, etc.)
    echo -e (_pure_prompt_first_line) # print current path, git branch/status, command duration
    _pure_place_iterm2_prompt_mark # place iTerm shell integration mark
    if test $exit_code -ne 0
        echo -e -n (set_color red)$exit_code(set_color normal)
    end
    echo -e -n (_pure_prompt $exit_code) # print prompt
    echo -e (_pure_prompt_ending) # reset colors and end prompt

    set _pure_fresh_session false
end
