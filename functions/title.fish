function title --description 'Change current terminal title'
    if test (count $argv) -lt 1
        echo "You need to specify a title to set"
        return 1
    end

    echo "function fish_title; echo \"$argv\"; end" | source -
end
