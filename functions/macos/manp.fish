function manp -d 'Open a specified man page in Preview'
    if test (count $argv) -eq 0
        echo "Usage: manp <manpage>" >&2
        return 1
    end
    man -t $argv | open -f -a Preview
end
