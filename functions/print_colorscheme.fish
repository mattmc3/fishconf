function print_colorscheme \
    --description "Print color scheme"

    # piped/redirected input
    set --local color
    if not [ -t 0 ]
        while read -l color
            set argv $argv $color
        end
    end

    if [ (count $argv) -eq 0 ]
        return 1
    end

    set --local colornames black red green yellow blue magenta cyan white \
        brblack brred brgreen bryellow brblue brmagenta brcyan brwhite
    for i in (seq 1 (count $argv))
        set colorid (math "($i-1) % "(count $colornames)" + 1")
        set color $argv[$i]
        if test "$color" != ""
            printf '%s%-10s%s %s  %s  %s\n' \
                (set_color $color) $colornames[$colorid] (set_color normal) \
                (set_color --background $color) $color (set_color normal)
        end
    end
end
