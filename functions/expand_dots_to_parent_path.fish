function expand_dots_to_parent_path -d 'expand ... to ../.. etc'
    # Get commandline up to cursor
    set --local cmd (commandline --cut-at-cursor)

    # Match last line
    switch $cmd[-1]
        case '*..'
            commandline --insert '/..'
        case '*'
            commandline --insert '.'
    end
end
