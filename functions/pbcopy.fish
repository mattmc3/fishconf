function pbcopy -d 'Copy things'
    switch (uname)
        case Darwin
            command pbcopy $argv
        case Cygwin
            tee > /dev/clipboard
        case *
            if type xclip &>/dev/null
                xclip -selection clipboard -in
            else if type xsel &>/dev/null
                xsel --clipboard --input
            end
    end
end
