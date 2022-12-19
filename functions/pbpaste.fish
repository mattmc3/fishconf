function pbpaste -d 'Paste things'
    switch (uname)
        case Darwin
            command pbpaste $argv
        case Cygwin
            cat /dev/clipboard
        case *
            if type xclip &>/dev/null
                xclip -selection clipboard -out
            else if type xsel &>/dev/null
                xsel --clipboard --output
            end
    end
end
