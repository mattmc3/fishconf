function ls --description 'ls with color'
    switch (uname -s)
        case Darwin
            /bin/ls -GFh --color=auto $argv
        case '*'
            /bin/ls -GFh --color=auto --group-directories-first $argv
    end
end
