function ls --description 'ls with color'
    switch (uname -s)
        case Darwin
            /bin/ls -L -G $argv
        case '*'
            /bin/ls -L --group-directories-first --color=auto $argv
    end
end
