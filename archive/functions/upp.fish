function upp --description 'Get the path of an ancestor directory'
    test -n "$argv" || set argv 1
    set pathname $PWD/(string repeat -n "$argv[1]" ../ 2>/dev/null)
    realpath $pathname
end
