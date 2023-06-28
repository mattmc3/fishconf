function rm --description 'rm is dangerous - warn'
    echo "Use del or /bin/rm instead." >&2
    commandline -r "del $argv"
    return 1
end
