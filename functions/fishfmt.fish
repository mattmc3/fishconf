function fishfmt -d 'Formats all provided fish files'
    for f in $argv
        if [ -f "$f" ]
            fish_indent -w "$f"
        end
    end
end
