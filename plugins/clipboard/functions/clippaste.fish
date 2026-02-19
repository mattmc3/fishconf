function clippaste --description 'Paste data from clipboard'
    set --local ostype (uname -s | string lower)
    if test $ostype = darwin
        pbpaste
    else
        echo >&2 "Unsupported OS: '$ostype'."
    end
end
