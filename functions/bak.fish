function bak --description 'backup a file'
    set --local now (date +"%Y%m%d-%H%M%S")
    for f in $argv
        if not test -e "$f"
            echo "file not found: $f" >&2
            continue
        end
        cp -R "$f" "$f".$now
    end
end
