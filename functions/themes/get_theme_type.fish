function determine_theme_type --argument-names color
    # https://github.com/mbadolato/iTerm2-Color-Schemes/blob/a914b8aaada2e66b28647d82f937cb807b5dab6f/tools/converter.py#L94-L99\
    set color (string upper $color | string replace '#' '')
    set -l hexcolor \
        (string sub -s 1 -l 2 $color) \
        (string sub -s 3 -l 2 $color) \
        (string sub -s 5 -l 2 $color)

    set r (echo "ibase=16; $hexcolor[1]" | bc)
    set g (echo "ibase=16; $hexcolor[2]" | bc)
    set b (echo "ibase=16; $hexcolor[3]" | bc)

    if test (math 0.2126 x $r + 0.7152 x $g + 0.0722 x $b) -lt 40
        echo dark
    else
        echo light
    end
end
