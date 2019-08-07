function isint
    [ "$argv" -eq "$argv" ] ^/dev/null; and return 0; or return 1
end
