function open -d 'Open things'
    switch (uname)
        case Darwin
            command open $argv
        case Cygwin
            cygstart $argv
        case *
            xdg-open $argv
    end
end
