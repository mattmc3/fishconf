function clippaste --description 'Paste data from clipboard'
    set --local ostype (uname -s)
    if test $ostype = Darwin
        pbpaste
    else
        echo >&2 "Unsupported OS: '$ostype'."
    end
end
