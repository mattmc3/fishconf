function ls --description 'ls with color'
    if type -q eza
        eza --group-directories-first --classify --color=auto --icons=auto $argv
    else if string match -q 'darwin*' $OSTYPE
        /bin/ls -GFh --color=auto $argv
    else
        /bin/ls -GFh --color=auto --group-directories-first $argv
    end
end
