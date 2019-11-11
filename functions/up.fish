function up --description 'Travel up directories'
    test -n "$argv" || set argv 1
    eval (string repeat -n "$argv[1]" ../ ^/dev/null) || begin
        echo "Invalid arguments '$argv'"\n"Usage:"(status function)" <levels>" >&2
        return 2
    end
end
