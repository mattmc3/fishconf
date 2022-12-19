function o -d 'Open things'
    switch (uname)
        case Darwin
            open $argv
        case Cygwin
            cygstart $argv
        case *
            xdg-open $argv
    end
end
