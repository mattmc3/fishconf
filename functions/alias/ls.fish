function ls --description 'ls with color'
    switch (uname -s)
        case Darwin
            /bin/ls -G $argv
        case '*'
            /bin/ls --group-directories-first --color=auto $argv
    end
end
