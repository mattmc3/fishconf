function isint
    [ "$argv" -eq "$argv" ] ^/dev/null && return 0 || return 1
end
