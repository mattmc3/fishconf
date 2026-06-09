function print_colorscheme \
    --description "Print color scheme"

    argparse \
        'black=' 'red=' 'green=' 'yellow=' \
        'blue=' 'magenta=' 'cyan=' 'white=' \
        'brblack=' 'brred=' 'brgreen=' 'bryellow=' \
        'brblue=' 'brmagenta=' 'brcyan=' 'brwhite=' \
        -- $argv
    or return

    set --local colornames black red green yellow blue magenta cyan white \
        brblack brred brgreen bryellow brblue brmagenta brcyan brwhite

    for name in $colornames
        set --local flagvar "_flag_$name"
        set --local color $$flagvar
        set --local display (if test -n "$color"; echo $color; else; echo $name; end)
        printf '%-12s %s%-12s%s %s     %s  %s\n' \
            $name \
            (set_color $display) $name (set_color normal) \
            (set_color --background $display) (set_color normal) \
            $color
    end
end
