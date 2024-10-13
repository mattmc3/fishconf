function up -d 'Travel up any number of directories'
    test -n "$argv" || set argv 1
    set --local balloons (string repeat -n "$argv[1]" "../" 2>/dev/null) || begin
        echo "Invalid arguments '$argv'"\n"Usage: "(status function)" <levels>" >&2
        return 2
    end
    cd $balloons
end
