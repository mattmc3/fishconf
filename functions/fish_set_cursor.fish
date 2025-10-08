function fish_set_cursor
    set --local cur
    switch $argv[1]
        case bar beam line
            set cur 6 # steady bar
        case block
            set cur 2 # steady block
        case underline underscore
            set cur 4 # steady underline
        case blink-bar blink-beam
            set cur 5
        case blink-block
            set cur 1
        case blink-underline blink-underscore
            set cur 3
        case '*'
            echo "Usage: fish_set_cursor [bar|block|underline|blink-bar|blink-block|blink-underline]" >&2
            return 1
    end

    printf '\e[%d q' $cur
end
