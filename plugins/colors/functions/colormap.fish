function colormap --description "Print terminal color swatches"
    for i in (seq 0 255)
        set padded (printf '%03d' $i)
        printf '\e[48;5;%dm  \e[49m\e[38;5;%dm%s\e[39m ' $i $i $padded
        if test (math "($i + 1) % 6") -eq 4
            printf '\n'
        end
    end
end
