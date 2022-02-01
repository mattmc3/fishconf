function ql -d 'Quick-Look a specified file or directory'
    if test (count $argv) -eq 0
        echo "Usage: ql <list>" >&2
        return 1
    end
    qlmanage >/dev/null 2>/dev/null -p $argv &
end
