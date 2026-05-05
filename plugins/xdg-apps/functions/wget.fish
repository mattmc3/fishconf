if command -q wget
    function wget
        command wget --hsts-file=$XDG_STATE_HOME/wget-hsts $argv
    end
end
