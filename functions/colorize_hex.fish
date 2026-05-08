function colorize_hex -d 'Preview hex color codes below the prompt'
    set --local cmd (commandline)
    set --local colorstrings (string match -ra '\b[0-9A-Fa-f]{6}\b' -- $cmd)
    if test (count $colorstrings) -eq 0
        return
    end

    set --local colorized $cmd
    for color in $colorstrings
        set --local lcolor (string lower $color)
        set colorized (string replace --all -- $color \
            (set_color --background $lcolor)"$color"(set_color normal) \
            $colorized)
    end

    printf '\e7\n\r\e[K%s\e[K\e8' $colorized
end
